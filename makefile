TEX=pdflatex
GLO=makeglossaries
BIB=biber

all:
	latexmk -pdf -r .latexmkrc main

main:
	$(TEX) -interaction=nonstopmode -halt-on-error -shell-escape main.tex

protocols:
	cd content/projektmanagement/sitzungsprotokolle/ && \
	find . -name "protokoll-*.tex" -exec $(TEX) -interaction=nonstopmode -halt-on-error -shell-escape {} \;

glo:
	$(GLO) main

bib:
	$(BIB) main

clean:
	rm -rf main.pdf _minted-* *.aux *.bbl *.bcf *.blg *.decisions *.fdb_latexmk *.fls *.fmt *.glg *.glo *.gls *.ist *.listing *.lof *.log *.lot *.minted *.mw *.out *.pseudocode *.run.xml *.sta *.synctex.gz *.toc

short:
	latexmk -pdf -r .latexmkrc short
