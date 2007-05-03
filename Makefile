GENERATED=cache-pslba/ $(wildcard output/*.xml output/*.html templates/*tmplc)
RSYNC_EXCLUDE=$(shell echo $(GENERATED) | sed -e 's/^\|\s\+/ --exclude /g')

all:
	@echo $(RSYNC_EXCLUDE)

# provisorio, depois colocamos para o local definitivo
sync:
	rsync -avp $(RSYNC_EXCLUDE) . terceiro@people.softwarelivre.org:public_html/planeta-psl-ba
	

clean:
	rm -rf $(GENERATED)
