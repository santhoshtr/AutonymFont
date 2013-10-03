fontpath=/usr/share/fonts/truetype/Autonym
fonts="Autonym"
all: clean compile webfonts test
compile:
# generate ttf files from sfd files
	@for font in `echo ${fonts}`; \
	do \
		./generate.pe $${font}.sfd; \
		echo "Compiled the font $${font}";\
	done 

install: compile
# copy ttf files to system font directory
	@for font in `echo ${fonts}`; \
	do \
		echo "Installing the font $${font}";\
		install -D -m 0644 $${font}.ttf ${DESTDIR}/${fontpath}/$${font}.ttf; \
	done

uninstall:
# remove fonts from system font directories
	@for font in `echo ${fonts}`; \
	do \
		if [ -f ${DESTDIR}/${fontpath}/$${font}.ttf ]; then rm -f ${DESTDIR}/${fontpath}/$${font}.ttf; fi \
		echo "Uninstalled the font $${font}";\
	done

clean:
# remove ttf fonts
	@for font in `echo ${fonts}`; \
	do \
		if [ -f $${font}.ttf ]; then rm -f $${font}.ttf; fi \
	done

test: compile
# Test the fonts
	@for font in `echo ${fonts}`; \
	do \
		echo "Testing font $${font}";\
		hb-view $${font}.ttf --debug --text-file autonyms.txt --output-file Autonyms.pdf; \
	done

webfonts: compile
# generate webfonts
	@for font in `echo ${fonts}`; \
	do \
		sfntly -w -h $${font}.ttf $${font}.woff; \
		sfntly -e -x -h $${font}.ttf $${font}.eot; \
		echo "Webfonts generated for $${font}"; \
	done
	
