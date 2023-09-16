from colors import color

color(c)

config.load_autoconfig(False)

c.colors.webpage.preferred_color_scheme = 'dark'

c.content.javascript.clipboard = 'access'
c.content.autoplay = False

c.downloads.location.suggestion = 'both'
c.downloads.remove_finished = 8

c.hints.radius = 0
c.keyhint.radius = 0
c.prompt.radius = 0

c.tabs.show = 'multiple'

c.editor.command = ['nvim', '{file}']

config.bind(',v', 'hint media spawn mpv {hint-url}')
config.bind(',m', 'hint media spawn nsxiv {hint-url}')
