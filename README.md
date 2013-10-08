Autonym Font
===========

A font that can render all language autonyms.

If we want to show a large number of languages written in their own 
scripts(autonyms), we cannot apply the usual webfonts to it. This is because
since each script require a webfonts, we will end up in using a large number
of webfonts. This can cause large bandwidth usage.

Examples of this usecase is a language selector.

Autonym font tries to solve this. The font contains glyphs and opentype rules
for rendering the language autonyms. And it contains only those glyphs for a
language. For example, for Thai, the font has glyphs required for rendering ไทย 
alone.

The glyphs for the font is taken from a large number of free licensed Fonts.
See CREDITS file for the full list.

pyftsubset tool from Behdad(https://github.com/behdad/fonttools) helped a lot
in the develpment of this font.

Fontforge is used as the font editing program.

Adding a new language autonym to this font
=====================================
Assuming you know basics of Automake, Fontforge, Opentype rules, Harfbuzz etc.
(Sorry, font development is not that easy)

1. Identify a font that has the glyphs for the new language autonym.
2. Important: The font should have a free license that allows reuse of the
glyphs. Dont violate any license. Give proper credits.
3. Use pyftsubset to subset the font.

```bash
pyftsubset FontName.ttf --text="YourLanguageAutonym"
```

4. This will create a new font named FontName.ttf.subset.
5. Open the Autonym font using fontforge. Merge the subset font to Autonym font using
Element->Merge fonts... option.
6. Run make test to test the newly added glyphs.

License
======

This Font Software is licensed under the SIL Open Font License, Version 1.1.
See COPYING file for more information.


