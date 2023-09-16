# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Scheme name: {{scheme-name}}
# Scheme author: {{scheme-author}}
# Template author: theova and Daniel Mulford
# Commentary: Tinted Theming: (https://github.com/tinted-theming)

base00 = "#282828"
base01 = "#CC241D"
base02 = "#98971A"
base03 = "#D79921"
base04 = "#458588"
base05 = "#B16286"
base06 = "#689D6A"
base07 = "#A89984"
base08 = "#928374"
base09 = "#FB4934"
base0A = "#B8BB26"
base0B = "#FABD2F"
base0C = "#83A598"
base0D = "#D3869B"
base0E = "#8EC07C"
base0F = "#EBDBB2"

# set qutebrowser colors

def color(c):
    # Text color of the completion widget. May be a single color to use for
    # all columns or a list of three colors, one for each column.
    c.colors.completion.fg = base0F
    # Background color of the completion widget for odd rows.
    c.colors.completion.odd.bg = base00
    # Background color of the completion widget for even rows.
    c.colors.completion.even.bg = base00
    # Foreground color of completion widget category headers.
    c.colors.completion.category.fg = base02
    # Background color of the completion widget category headers.
    c.colors.completion.category.bg = base00
    # Top border color of the completion widget category headers.
    c.colors.completion.category.border.top = base00
    # Bottom border color of the completion widget category headers.
    c.colors.completion.category.border.bottom = base00
    # Foreground color of the selected completion item.
    c.colors.completion.item.selected.fg = base00
    # Background color of the selected completion item.
    c.colors.completion.item.selected.bg = base03
    # Top border color of the selected completion item.
    c.colors.completion.item.selected.border.top = base03
    # Bottom border color of the selected completion item.
    c.colors.completion.item.selected.border.bottom = base03
    # Foreground color of the matched text in the selected completion item.
    c.colors.completion.item.selected.match.fg = base01
    # Foreground color of the matched text in the completion.
    c.colors.completion.match.fg = base06
    # Color of the scrollbar handle in the completion view.
    c.colors.completion.scrollbar.fg = base06
    # Color of the scrollbar in the completion view.
    c.colors.completion.scrollbar.bg = base00
    
    # Background color of disabled items in the context menu.
    c.colors.contextmenu.disabled.bg = base08
    # Foreground color of disabled items in the context menu.
    c.colors.contextmenu.disabled.fg = base0F
    # Background color of the context menu. If set to null, the Qt default is used.
    c.colors.contextmenu.menu.bg = base00
    # Foreground color of the context menu. If set to null, the Qt default is used.
    c.colors.contextmenu.menu.fg =  base0F
    # Background color of the context menu’s selected item. If set to null, the Qt default is used.
    c.colors.contextmenu.selected.bg = base04
    #Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
    c.colors.contextmenu.selected.fg = base00
    
    # Background color for the download bar.
    c.colors.downloads.bar.bg = base00
    # Color gradient start for download text.
    c.colors.downloads.start.fg = base00
    # Color gradient start for download backgrounds.
    c.colors.downloads.start.bg = base06
    # Color gradient end for download text.
    c.colors.downloads.stop.fg = base00
    # Color gradient stop for download backgrounds.
    c.colors.downloads.stop.bg = base05
    # Foreground color for downloads with errors.
    c.colors.downloads.error.fg = base01
    
    # Font color for hints.
    c.colors.hints.fg = base00
    # Background color for hints. Note that you can use a `rgba(...)` value
    # for transparency.
    c.colors.hints.bg = '#BA' + base03[1:]
    # Font color for the matched part of hints.
    c.colors.hints.match.fg = base01
    
    # Text color for the keyhint widget.
    c.colors.keyhint.fg = base0F
    # Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = base06
    # Background color of the keyhint widget.
    c.colors.keyhint.bg = base00
    c.hints.border = '0px solid #000000'
    
    # Foreground color of an error message.
    c.colors.messages.error.fg = base00
    # Background color of an error message.
    c.colors.messages.error.bg = base01
    # Border color of an error message.
    c.colors.messages.error.border = base00
    
    # Foreground color of a warning message.
    c.colors.messages.warning.fg = base00
    # Background color of a warning message.
    c.colors.messages.warning.bg = base05
    # Border color of a warning message.
    c.colors.messages.warning.border = base00
    
    # Foreground color of an info message.
    c.colors.messages.info.fg = base0F
    # Background color of an info message.
    c.colors.messages.info.bg = base00
    # Border color of an info message.
    c.colors.messages.info.border = base00
    
    # Foreground color for prompts.
    c.colors.prompts.fg = base0F
    # Border used around UI elements in prompts.
    c.colors.prompts.border = base02
    # Background color for prompts.
    c.colors.prompts.bg = base00
    # Background color for the selected item in filename prompts.
    c.colors.prompts.selected.bg = base03
    # Foreground color for the selected item in filename prompts.
    c.colors.prompts.selected.fg = base00
    
    # Foreground color of the statusbar.
    c.colors.statusbar.normal.fg = base0F
    # Background color of the statusbar.
    c.colors.statusbar.normal.bg = base00
    # Foreground color of the statusbar in insert mode.
    c.colors.statusbar.insert.fg = base02
    # Background color of the statusbar in insert mode.
    c.colors.statusbar.insert.bg = base00
    # Foreground color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.fg = base04
    # Background color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.bg = base00
    # Foreground color of the statusbar in private browsing mode.
    c.colors.statusbar.private.fg = base01
    # Background color of the statusbar in private browsing mode.
    c.colors.statusbar.private.bg = base00
    # Foreground color of the statusbar in command mode.
    c.colors.statusbar.command.fg = base06
    # Background color of the statusbar in command mode.
    c.colors.statusbar.command.bg = base00
    # Foreground color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.fg = base05
    # Background color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.bg = base00
    # Foreground color of the statusbar in caret mode.
    c.colors.statusbar.caret.fg = base03
    # Background color of the statusbar in caret mode.
    c.colors.statusbar.caret.bg = base00
    # Foreground color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.fg = base03
    # Background color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.bg = base00
    # Background color of the progress bar.
    c.colors.statusbar.progress.bg = base02
    # Default foreground color of the URL in the statusbar.
    c.colors.statusbar.url.fg = base04
    # Foreground color of the URL in the statusbar on error.
    c.colors.statusbar.url.error.fg = base01
    # Foreground color of the URL in the statusbar for hovered links.
    c.colors.statusbar.url.hover.fg = base05
    # Foreground color of the URL in the statusbar on successful load
    # (http).
    c.colors.statusbar.url.success.http.fg = base0F
    # Foreground color of the URL in the statusbar on successful load
    # (https).
    c.colors.statusbar.url.success.https.fg = base04
    # Foreground color of the URL in the statusbar when there's a warning.
    c.colors.statusbar.url.warn.fg = base01
    
    # Background color of the tab bar.
    c.colors.tabs.bar.bg = base00
    # Color gradient start for the tab indicator.
    c.colors.tabs.indicator.start = base06
    # Color gradient end for the tab indicator.
    c.colors.tabs.indicator.stop = base06
    # Color for the tab indicator on errors.
    c.colors.tabs.indicator.error = base01
    # Foreground color of unselected even tabs.
    c.colors.tabs.even.fg = base0F
    # Foreground color of unselected odd tabs.
    c.colors.tabs.odd.fg = base0F
    # Background color of unselected even tabs.
    c.colors.tabs.even.bg = base00
    # Background color of unselected odd tabs.
    c.colors.tabs.odd.bg = base00
    # Foreground color of selected odd tabs.
    c.colors.tabs.selected.odd.fg = base00
    # Foreground color of selected even tabs.
    c.colors.tabs.selected.even.fg = base00
    # Background color of selected odd tabs.
    c.colors.tabs.selected.odd.bg = base06
    # Background color of selected even tabs.
    c.colors.tabs.selected.even.bg = base06
    # Foreground color of pinned unselected even tabs.
    c.colors.tabs.pinned.even.fg = base06
    # Foreground color of pinned unselected odd tabs.
    c.colors.tabs.pinned.odd.fg = base06
    # Background color of pinned unselected even tabs.
    c.colors.tabs.pinned.even.bg = base00
    # Background color of pinned unselected odd tabs.
    c.colors.tabs.pinned.odd.bg = base00
    # Foreground color of pinned selected even tabs.
    c.colors.tabs.pinned.selected.even.fg = base00
    # Foreground color of pinned selected odd tabs.
    c.colors.tabs.pinned.selected.odd.fg = base00
    # Background color of pinned selected even tabs.
    c.colors.tabs.pinned.selected.even.bg = base06
    # Background color of pinned selected odd tabs.
    c.colors.tabs.pinned.selected.odd.bg = base06
    
    # Background color for webpages if unset (or empty to use the theme's
    # color).
    c.colors.webpage.bg = base00
