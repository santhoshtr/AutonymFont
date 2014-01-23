Autonym Font
============

A font that can render all language autonyms.

Language autonym means language written in its own script. Example: ગુજરાત, ქართული

If we want to show a large number of language autonyms, we cannot apply
the usual webfonts to it. This is because when
each script requires a webfont, we will end up using a large number of
webfonts. This can cause large bandwidth usage.

An example of this use case is a language selector on a website.

Autonym font tries to solve this. The font contains glyphs and opentype rules
for rendering the language autonyms. And it contains only those glyphs for
a language. For example, for Thai, the font has glyphs required for
rendering ไทย alone.

The glyphs for the font is taken from a large number of free licensed fonts.
See CREDITS file for the full list.

pyftsubset tool from Behdad (https://github.com/behdad/fonttools) helped a lot
in the develpment of this font.

[FontForge](http://fontforge.github.io/) is used as the font editing program.

Download
========
See [releases](https://github.com/santhoshtr/AutonymFont/releases)
Adding a new language autonym to this font
==========================================

Assuming you know basics of [Automake](http://www.gnu.org/software/automake/), [FontForge](http://fontforge.github.io/), [OpenType](http://en.wikipedia.org/wiki/OpenType) rules, [Harfbuzz](http://www.freedesktop.org/wiki/Software/HarfBuzz/) etc.
(Sorry, font development is not that easy)

1. Identify a font that has the glyphs for the new language autonym.

2. Important: The font should have a free license that allows reuse of the
glyphs. Don't violate any license. Give proper credits.

3. Use [pyftsubset](https://github.com/behdad/fonttools) to subset the font.

	```bash
	pyftsubset FontName.ttf --text="YourLanguageAutonym"
	```

4. This will create a new font named ```FontName.ttf.subset```.

5. Open the ```Autonym.sfd``` using FontForge. Merge the subset font using *Element* -> *Merge fonts*, available in top menubar. Alternatively, you can also use ```merge.pe``` from command line.

	```bash
	./merge.pe FontName.ttf.subset
	```

6. Run ```make test``` to test the newly added glyphs.

License
======

This Font Software is licensed under the SIL Open Font License, Version 1.1.
See COPYING file for more information.
