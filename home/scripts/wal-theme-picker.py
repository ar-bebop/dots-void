#!/usr/bin/env python

from argparse import ArgumentParser
from PIL import Image
import os
import json
from math import sqrt
import numpy as np
from collections import Counter

MAX_FIT_ITERATIONS = 100
MAX_BINS = 1000


def wkmean(k, data, weights=None, metric='Euclidian',
           MAX_ITERATIONS=1000, method='k++'):
    """
    Weighted k-means algorithm with relative weighted population count
    for each cluster. Returns the best centroids in the form
    positions, relative weighted populations and fit errror.
    If no weights are provided all data points are assumed to be equal.
    If no metric is provided, the standard Euclidian metric is used.
    Possible methods are:
        'k++_pdf' for kmeans++ initialization with PDF distributed choice
        'k++_max' for kmeans++ initialization with farthest point choice
        'uniform' for uniform [-0.5, 0.5] initialization
    """

    def euclidian_metric(coords):
        return (coords**2).sum(axis=1)

    def kmeans_plus_plus_initialization(X, k, pdf_method=True):
        '''Initialize one point at random. Loop for k - 1 iterations:
        Next, calculate for each point the distance of the point from its
        nearest center. Sample a point with a probability proportional to
        the square of the distance of the point from its nearest center.'''
        def distance_to_centroids(data, centers):
            distance = np.sum((np.array(centers) - data[:, None, :])**2,
                              axis=2)
            return distance

        centers = []
        X = np.array(X)

        # Sample the first point
        initial_index = np.random.choice(range(X.shape[0]), )
        centers.append(X[initial_index, :].tolist())

        # Loop and select the remaining points
        for i in range(k - 1):
            distance = distance_to_centroids(X, np.array(centers))

            if i == 0:
                pdf = distance/np.sum(distance)
                centroid_new = X[np.random.choice(range(X.shape[0]),
                                                  replace=False,
                                                  p=pdf.flatten())]
            else:
                # Calculate the distance of each point to its nearest centroid
                dist_min = np.min(distance, axis=1)
                if pdf_method is True:
                    pdf = dist_min/np.sum(dist_min)
                    # Sample one point from the given distribution
                    centroid_new = X[np.random.choice(range(X.shape[0]),
                                                      replace=False,
                                                      p=pdf)]
                else:
                    index_max = np.argmax(dist_min, axis=0)
                    centroid_new = X[index_max, :]
            centers.append(centroid_new.tolist())

        return np.array(centers)

    # Uniform random initialization
    def random_coord_initialization(data, k):
        dim = np.array(data[1]).shape[0]
        centroids = [np.random.rand(dim) - 0.5 for _ in range(k)]
        return np.array(centroids)

    # Stop criteria for k-means update
    def should_stop(oldCentroids, centroids, iterations):
        if iterations > MAX_ITERATIONS:
            return True
        return (oldCentroids == centroids).all()

    # Returns array of indexes of closest centroid for each point
    def assign_centroids(data, centroids):
        distances = [0 for _ in range(k)]
        for ii in range(k):
            diff = data - centroids[ii]
            distances[ii] = metric(diff)
        distances = np.array(distances)
        closest_centroid = distances.argmin(axis=0)
        return closest_centroid

    # New centroid positions, their relative weighted population and error
    def update_centroids(data, weights, labels):
        neighborhood = np.array([labels == jj for jj in range(k)])
        neighborhood = neighborhood * weights
        # Sets unnormalized cumulative centroid
        centroids = neighborhood.dot(data)

        populations = np.array([0 for _ in range(k)]).astype(float)
        error = 0
        for jj in range(k):
            s = sum(neighborhood[jj])
            if s != 0:
                centroids[jj] = centroids[jj] / s
                diff = data - centroids[jj]
                distances = metric(diff)
                error += distances.dot(neighborhood[jj])
                populations[jj] = s
        return np.array(centroids), populations, error

    # Make the initial preparations
    data = np.array(data)
    if weights is None:
        weights = np.array([1 for _ in data])
    else:
        weights = np.array(weights)
        weights = weights / sum(weights)
    if metric == 'Euclidian':
        metric = euclidian_metric
    if method == 'uniform':
        def initialize_centroids(data, k):
            return random_coord_initialization(data, k)
    elif method == 'k++_max':
        def initialize_centroids(data, k):
            return kmeans_plus_plus_initialization(data, k, pdf_method=False)
    elif method == 'k++_pdf':
        def initialize_centroids(data, k):
            return kmeans_plus_plus_initialization(data, k, pdf_method=True)
    else:
        raise NotImplementedError()

    # Initialize clusters
    centroids = initialize_centroids(data, k)
    populations = [0 for _ in range(k)]
    error = 10**15

    # Initialize book keeping vars
    iterations = 0
    oldCentroids = None

    # Repeat until centroids converge to a local minima
    while not should_stop(oldCentroids, centroids, iterations):
        oldCentroids = centroids
        iterations += 1

        # Find the closest centroid for each point
        labels = assign_centroids(data, centroids)

        # Update centroid positions
        centroids, populations, error = update_centroids(data,
                                                         weights, labels)

    return np.array(centroids), np.array(populations), error


def rgb_dist(rgb1, rgb2):
    lab1 = rgb2lab(rgb1)
    lab2 = rgb2lab(rgb2)
    return cie94(lab1, lab2)

def rgb(x):
    """Convert #[AA]RRGGBB color in integer or string to (r,g,b) tuple

    Alpha (AA) component is simply ignored.

    rgb(0xff0000ff)
    >>> (0, 0, 255)
    rgb('#ff0000')
    >>> (255, 0, 0)
    """

    if isinstance(x, str) and x[0] == '#':
        x = int(x[1:], 16)
    return ((x >> 16) & 0xff, (x >> 8) & 0xff, (x) & 0xff)

def _square(x):
    return x * x

def cie94(L1_a1_b1, L2_a2_b2):
    """Calculate color difference by using CIE94 formulae

    See http://en.wikipedia.org/wiki/Color_difference or
    http://www.brucelindbloom.com/index.html?Eqn_DeltaE_CIE94.html.

    cie94(rgb2lab((255, 255, 255)), rgb2lab((0, 0, 0)))
    >>> 58.0
    cie94(rgb2lab(rgb(0xff0000)), rgb2lab(rgb('#ff0000')))
    >>> 0.0
    """

    L1, a1, b1 = L1_a1_b1
    L2, a2, b2 = L2_a2_b2

    C1 = sqrt(_square(a1) + _square(b1))
    C2 = sqrt(_square(a2) + _square(b2))
    delta_L = L1 - L2
    delta_C = C1 - C2
    delta_a = a1 - a2
    delta_b = b1 - b2
    delta_H_square = _square(delta_a) + _square(delta_b) - _square(delta_C)
    return (sqrt(_square(delta_L)
            + _square(delta_C) / _square(1.0 + 0.045 * C1)
            + delta_H_square / _square(1.0 + 0.015 * C1)))

def rgb2lab(R_G_B):
    """Convert RGB colorspace to Lab

    Adapted from http://www.easyrgb.com/index.php?X=MATH.
    """

    R, G, B = R_G_B

    # Convert RGB to XYZ

    var_R = (R / 255.0)        # R from 0 to 255
    var_G = (G / 255.0)        # G from 0 to 255
    var_B = (B / 255.0)        # B from 0 to 255

    if (var_R > 0.04045):   var_R = ((var_R + 0.055) / 1.055) ** 2.4
    else:                   var_R = var_R / 12.92
    if (var_G > 0.04045):   var_G = ((var_G + 0.055) / 1.055) ** 2.4
    else:                   var_G = var_G / 12.92
    if (var_B > 0.04045):   var_B = ((var_B + 0.055) / 1.055) ** 2.4
    else:                   var_B = var_B / 12.92

    var_R = var_R * 100.0
    var_G = var_G * 100.0
    var_B = var_B * 100.0

    # Observer. = 2°, Illuminant = D65
    X = var_R * 0.4124 + var_G * 0.3576 + var_B * 0.1805
    Y = var_R * 0.2126 + var_G * 0.7152 + var_B * 0.0722
    Z = var_R * 0.0193 + var_G * 0.1192 + var_B * 0.9505

    # Convert XYZ to L*a*b*

    var_X = X / 95.047         # ref_X =  95.047   Observer= 2°, Illuminant= D65
    var_Y = Y / 100.000        # ref_Y = 100.000
    var_Z = Z / 108.883        # ref_Z = 108.883

    if (var_X > 0.008856):  var_X = var_X ** (1/3.0)
    else:                   var_X = (7.787 * var_X) + (16.0 / 116.0)
    if (var_Y > 0.008856):  var_Y = var_Y ** (1/3.0)
    else:                   var_Y = (7.787 * var_Y) + (16.0 / 116.0)
    if (var_Z > 0.008856):  var_Z = var_Z ** (1/3.0)
    else:                   var_Z = (7.787 * var_Z) + (16.0 / 116.0)

    CIE_L = (116.0 * var_Y) - 16.0
    CIE_a = 500.0 * (var_X - var_Y)
    CIE_b = 200.0 * (var_Y - var_Z)
    return (CIE_L, CIE_a, CIE_b)

# Function that returns the importance of each color in 'colors'
# depending on its relative population in the image and its rgb
def calculate_importances(populations, colors):
    population_importances = populations
    color_importances = [(max(c) - min(c)) / 256 for c in colors]
    return np.array(population_importances * color_importances)

# Loads an image and extracts colors and their frequencies from an image
def get_image_colors(args):
    with Image.open(args.image_path).convert('RGB') as im:
        tally = Counter(im.getdata())

    counts = list(tally.values())
    colors = list(tally.keys())

    return np.array(counts), np.array(colors)

# Uses K-means algorithm to find the best fitting palette
# of palette_size lengths for the image
def compute_image_palette(colors, counts, palette_size, method='k++_pdf'):
    # Repeats search multiple times to find the best fit
    best_palette = None
    best_populations = None
    best_error = 10**15
    for ii in range(MAX_FIT_ITERATIONS):
        palette, populations, error = wkmean(palette_size, colors,
                                             weights=counts,
                                             method=method)
        if error < best_error:
            best_error = error
            best_palette = palette
            best_populations = populations

    importances = calculate_importances(best_populations, best_palette)

    # Sort colors in the order of importance
    inds = importances.argsort()
    palette = np.array(best_palette)[inds[::-1]]
    importances = np.array(importances)[inds[::-1]]

    return np.array(palette), np.array(importances)

# Returns num_results closest themes to the given palette
def pick_best_themes(palette, importances, num_results):
    # Load themes
    dir_path = os.path.dirname(os.path.realpath(__file__))
    dir_path = dir_path + "/themes/"
    theme_names = [name[:-5] for name in os.listdir(dir_path)]
    themes = []
    for file_name in os.listdir(dir_path):
        with open(dir_path + file_name) as f:
            data = json.load(f)
        colors = [data['special']['foreground'],
                  data['special']['background'],
                  data['colors']['color0'],
                  data['colors']['color1'],
                  data['colors']['color2'],
                  data['colors']['color3'],
                  data['colors']['color4'],
                  data['colors']['color5'],
                  data['colors']['color6'],
                  data['colors']['color7']]
        colors = [rgb(color) for color in colors]
        themes.append(colors)
    themes = np.array(themes, dtype=int)

    # Evaluate the score for each theme
    theme_scores = []
    for theme in themes:
        distances = []
        for palette_color in palette:
            dist = [rgb_dist(palette_color, theme_color)
                    for theme_color in theme]
            min_dist = np.min(dist)
            distances.append(min_dist)
        distances = np.array(distances)
        score = importances.dot(distances)
        theme_scores.append(score)
    theme_scores = np.array(theme_scores)

    # Sort themes and return the first num_results themes
    inds = theme_scores.argsort()
    sorted_scores = theme_scores[inds][:num_results]
    sorted_themes = themes[inds][:num_results]
    sorted_names = np.array(theme_names)[inds][:num_results]
    return sorted_themes, sorted_scores, sorted_names

def parse_args():
    parser = ArgumentParser(
            description='Tries to pick the best color palette for a given image \
                    from a set of hand-picked syntax-highlighting palettes.')
    parser.add_argument('-n', type=int, default=10,
                        help='number of themes to print')
    parser.add_argument('-c', type=int, default=10,
                        help='number of dominating colors in image')
    parser.add_argument('image_path', metavar='image_path', type=str)
    args = parser.parse_args()
    return args

def print_results(names, scores):
    print("    Theme", ' ' * 32, "Score (lower is better)")
    for ii in range(len(names)):
        print(str(ii) + ')' + ' ' * (2 - len(str(ii))),
              names[ii], ' ' * (37 - len(names[ii])), scores[ii])

def colors_to_bins(counts, colors, bin_size):
    tally = dict()
    for ii in range(len(colors)):
        color = colors[ii]
        count = counts[ii]
        bin = tuple((color // bin_size) * bin_size + (bin_size // 2))
        tally[bin] = tally.get(bin, 0) + count

    new_colors = list(tally.keys())
    new_counts = list(tally.values())
    return np.array(new_counts), np.array(new_colors)


if __name__ == '__main__':
    args = parse_args()
    num_clusters = args.c
    num_results = args.n

    counts, colors = get_image_colors(args)
    bin_size = 1
    while len(counts) > MAX_BINS:
        bin_size *= 2
        counts, colors = colors_to_bins(counts, colors, bin_size)
    palette, importances = compute_image_palette(colors, counts, args.c,
                                                 method='k++_pdf')
    themes, scores, names = pick_best_themes(palette, importances, num_results)

    print_results(names, scores)
