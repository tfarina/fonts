On Ubuntu 9.04 with GNOME 2.26.1:

- Click on System > Preferences > Appearance > and select the Fonts tab

Default values:

- Application font:  Sans 10
- Document font:     Sans 10
- Desktop font:      Sans 10
- Window title font: Sans Bold 10
- Fixed width font:  Monospace 10

## Application font

This font is used in the menus, toolbars, and dialog boxes. It is the
name of the default font used by gtk+.

Key name: /desktop/gnome/interface/font_name

## Document font

This font is used to display documents in applications. It is the name
of the default font used for reading documents.

Key name: /desktop/gnome/interface/document_font_name

## Desktop font

This font is used in icon labels on the desktop.

Key name: /apps/nautilus/preferences/desktop_font

## Window title font

This font is used in the titlebars of windows.

Key name: /apps/metacity/general/titlebar_font

## Fixed width font

This font is generally used in terminal emulators and text editors for
programming.

Key name: /desktop/gnome/interface/monospace_font_name

# Rendering

## Monochrome

Renders fonts in black and white only. The edges of characters might appear
jagged in some cases because the characters are not antialiased. Antialiasing
is an effect that is applied to the edges of characters to make the characters
look soother.

## Best shapes

Antialiases fonts where possible. Use this option for standard Cathode Ray
Tube (CRT) monitors.

## Best contrast

Adjusts fonts to give the sharpest possible contrast, and also antialiases
fonts, so that characters have smooth edges. This option might enhance the
accessibility of the GNOME Desktop to users with visual impairments.

## Subpixel smoothing (LCDs)

Uses techniques that exploit the shape of individual Liquid Crystal Display
(LCD) pixels to render fonts smoothly. Use this option for LCD or flat screen
displays.

# Details

## Resolution (dots per inch)

Specifies the resolution to use when your screen renders fonts.

## Smoothing

Specifies how to antialias fonts.

## Hinting

Hinting is a font-rendering technique that improves the quality of fonts at
small sizes and at low screen resolutions. Specifies how to apply apply
hinting to your fonts.

## Subpixel order

Specifies the subpixel color order to your fonts. Use this option for LCD or
flat-screen displays.
