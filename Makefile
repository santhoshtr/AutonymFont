fontpath=/usr/share/fonts/truetype/Autonym
fonts="Autonym"

default:
# generate ttf files from sfd files
	@for font in `echo ${fonts}`; \
	do \
		./generate.pe $${font}.sfd; done 

install: *.ttf
# copy ttf files to system font directory
	@for font in `echo ${fonts}`; \
	do \
		install -D -m 0644 $${font}.ttf ${DESTDIR}/${fontpath}/$${font}.ttf; done

uninstall:
# remove fonts from system font directories
	@for font in `echo ${fonts}`; \
	do \
		if [ -f ${DESTDIR}/${fontpath}/$${font}.ttf ]; then rm -f ${DESTDIR}/${fontpath}/$${font}.ttf; fi \
	done

clean:
# remove ttf fonts
	@for font in `echo ${fonts}`; \
	do \
		if [ -f $${font}.ttf ]; then rm -f $${font}.ttf; fi \
	done

test:*.ttf
# Test the fonts
	@for font in `echo ${fonts}`; \
        do \
		hb-view $${font}.ttf --text-file autonyms.txt --output-file autonyms.pdf; \
	done

