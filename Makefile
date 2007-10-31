GENERATED=cache-pslba/ $(wildcard output/*.xml output/*.html templates/*tmplc) .svn
NOT_SYNC=planet/ test/
RSYNC_EXCLUDE=$(shell echo $(GENERATED) $(NOT_SYNC) | perl -e 'print "--exclude $$_ " foreach(split(/\s+/, <STDIN>));')

all:
	@echo $(RSYNC_EXCLUDE)

pseudosync:
	RSYNC_OPTS=--dry-run make sync 

# provisorio, depois colocamos para o local definitivo
sync:
	rsync -avp $(RSYNC_OPTS) $(RSYNC_EXCLUDE) . terceiro@people.softwarelivre.org:public_html/planeta-psl-ba
	

clean:
	rm -rf $(GENERATED)
