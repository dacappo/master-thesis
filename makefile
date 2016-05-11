DOCUMENT_NAME = MasterThesis

# Build the LaTeX document.
all: report

# Remove output directory.
clean:
	find . -name '*.acn' -type f -delete
	find . -name '*.acr' -type f -delete
	find . -name '*.alg' -type f -delete
	find . -name '*.aux' -type f -delete
	find . -name '*.glg' -type f -delete
	find . -name '*.glo' -type f -delete
	find . -name '*.gls' -type f -delete
	find . -name '*.ist' -type f -delete
	find . -name '*.lof' -type f -delete
	find . -name '*.log' -type f -delete
	find . -name '*.lol' -type f -delete
	find . -name '*.out' -type f -delete
	find . -name '*.toc' -type f -delete
	find . -name '*.bbl' -type f -delete
	find . -name '*.blg' -type f -delete
	find . -name '*.nlo' -type f -delete
	find . -name '*.nls' -type f -delete
	find . -name '*.ilg' -type f -delete
	find . -name '*.lot' -type f -delete
	find . -name '*blx.bib' -type f -delete
	find . -name '*.run.xml' -type f -delete
	find . -name '*.fdb_latexmk' -type f -delete

# Generate PDF output from LaTeX input files.
report:
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	bibtex $(DOCUMENT_NAME)
	makeindex $(DOCUMENT_NAME).nlo -s nomencl.ist -o $(DOCUMENT_NAME).nls
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)

deploy:
	scp MasterThesis.pdf patrick@patrick-spiegel.de:/var/www/html/MasterThesis.pdf
