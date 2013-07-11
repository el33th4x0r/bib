VIRTUAL=all
DEPS=egs.xtx Makefile
TARGETS=default byauthor bycategory byproject bytitle byyear
XFLAGS=--style homepage --add-in --add-proceedings

all: $(TARGETS:%=pubs-%.html)

clean:
	rm -f *~ .egs.cache.xtx

clobber: clean
	rm -f $(TARGETS:%=pubs-%.html)

pubs-default.html: $(DEPS)
	crosstex $(XFLAGS) --reverse-sort monthno --reverse-sort year --format html --output $@ $<

pubs-byauthor.html: $(DEPS)
	crosstex $(XFLAGS) --sort author --format html --output $@ egs.xtx

pubs-bytitle.html: $(DEPS)
	crosstex $(XFLAGS) --sort title --format html --output $@ egs.xtx

pubs-byproject.html: $(DEPS)
	crosstex $(XFLAGS) --reverse-sort monthno --reverse-sort year --heading subcategory --format html --output $@ egs.xtx

pubs-bycategory.html: $(DEPS)
	crosstex $(XFLAGS) --reverse-sort monthno --reverse-sort year --heading category --format html --output $@ egs.xtx

pubs-byyear.html: $(DEPS)
	crosstex $(XFLAGS) --reverse-sort monthno --reverse-sort year --reverse-heading year --format html --output $@ egs.xtx
