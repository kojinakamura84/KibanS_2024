###############################################################################
#                                                        December 4, 2002
#
# Makefile for a sample CDF Note - Stefan Stonjek  <s.stonjek@physics.ox.ac.uk>
#                                  Martin Hennecke <hennecke@fnal.gov> 
#
###############################################################################

TEXNAME=kiban_s
graphics_eps := $(wildcard figs/*.eps)
graphics_pdf := $(patsubst %info.tex,%.eps,%.pdf,$(wildcard figs/*.eps))

#ps: cv.ps pub.ps cl.ps ref.ps
#	echo done
pdf: $(TEXNAME).pdf

$(TEXNAME).pdf: $(TEXNAME).tex $(graphics_eps)
#	pdflatex $(TEXNAME).tex
	platex $(TEXNAME).tex && platex $(TEXNAME).tex && platex $(TEXNAME).tex && platex $(TEXNAME).tex && dvipdfmx $(TEXNAME).dvi 
#	acroread $(TEXNAME).pdf


#cl.ps: cl.tex
#	latex cl.tex && latex cl.tex && latex cl.tex && latex cl.tex && dvips cl.dvi -o
#	ps2pdf cl.ps cl.pdf
#
#pub.ps: pub.tex
#	latex pub.tex && latex pub.tex && latex pub.tex && latex pub.tex && dvips pub.dvi -o
#	ps2pdf pub.ps pub.pdf
#
#ref.ps: ref.tex
#	latex ref.tex && latex ref.tex && latex ref.tex && latex ref.tex && dvips ref.dvi -o
#	ps2pdf ref.ps ref.pdf


%.pdf: %.eps
	ps2pdf $< $@

.PHONY: clean
clean:
	rm -rf *.aux
distclean:
	rm -rf *.dvi *.aux *~ *.log *.txt *.html $(TEXNAME).pdf
