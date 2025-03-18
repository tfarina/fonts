On Ubuntu 16.04.7 with Xfce 4.12:

- Click on Start menu > Settings > Appearance > and select the Fonts tab

Default values:

- Default font: Sans 10

## Default font

This font is used in the menus, toolbars, and dialog boxes. It is the
name of the default font used by gtk+.

Key name: /Gtk/FontName

```
$ xfconf-query -c xsettings -p /Gtk/FontName
```

- Click on Start menu > Settings > Window Manager > and select the Style tab

Default values:

- Titlte font: Sans 12

## Window title font

This font is used in the titlebars of windows.

Key name: /general/title_font

```
$ xfconf-query -c xfwm4 -p /general/title_font
```
