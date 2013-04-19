DEPS=egs.xtx Makefile massage
TARGETS=pubs-default.html pubs-bytitle.html pubs-byauthor.html pubs-bycategory.html pubs-byproject.html pubs-byyear.html

all: $(TARGETS)

clean:
	rm -f *~

XFLAGS=--no-field pages --popups

clobber: clean
	rm -f $(TARGETS)

pubs-default.html: $(DEPS)
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year egs.xtx
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year egs.xtx
	./massage egs.html
	mv egs.html pubs-default.html
	rm .haux

pubs-byauthor.html: $(DEPS)
	xtx2html $(XFLAGS) --sort author egs.xtx
	xtx2html $(XFLAGS) --sort author egs.xtx
	./massage egs.html
	mv egs.html pubs-byauthor.html
	rm .haux

pubs-bytitle.html: $(DEPS)
	xtx2html $(XFLAGS) --sort title egs.xtx
	xtx2html $(XFLAGS) --sort title egs.xtx
	./massage egs.html
	mv egs.html pubs-bytitle.html
	rm .haux

pubs-byproject.html: $(DEPS)
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year --heading subcategory egs.xtx
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year --heading subcategory egs.xtx
	./massage egs.html
	mv egs.html pubs-byproject.html
	rm .haux

pubs-bycategory.html: $(DEPS)
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year --reverse-heading category egs.xtx
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year --reverse-heading category egs.xtx
	./massage egs.html
	mv egs.html pubs-bycategory.html
	rm .haux

pubs-byyear.html: $(DEPS)
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year --reverse-heading year egs.xtx
	xtx2html $(XFLAGS) --reverse-sort monthno --reverse-sort year --reverse-heading year egs.xtx
	./massage egs.html
	mv egs.html pubs-byyear.html
	rm .haux

