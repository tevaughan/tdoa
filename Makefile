
%.pdf : %.fig
	fig2dev -L pdf $< > $@

DOCNAME = tdoa
TEXNAME = $(DOCNAME).tex
PDFNAME = $(DOCNAME).pdf

.PHONY : all clean

all : $(PDFNAME)

$(PDFNAME) : $(TEXNAME) logo.pdf fdl-1.3.tex
	pdflatex $(DOCNAME)
	asy $(DOCNAME)-*.asy
	pdflatex $(DOCNAME)
	pdflatex $(DOCNAME)

clean :
	@rm -fv *.asy
	@rm -fv *.aux
	@rm -fv *.log
	@rm -fv *.out
	@rm -fv logo.pdf
	@rm -fv $(PDFNAME)

