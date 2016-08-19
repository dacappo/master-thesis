DOCUMENT_NAME = MasterThesis

# Build the LaTeX document.
all: report

# Generate PDF output from LaTeX input files.
report:
	rsync -a ./ tmp/ --exclude=tmp
	cd tmp/; \
		pdflatex -interaction=errorstopmode $(DOCUMENT_NAME) \
		bibtex $(DOCUMENT_NAME) \
		makeindex $(DOCUMENT_NAME).nlo -s nomencl.ist -o $(DOCUMENT_NAME).nls \
		pdflatex -interaction=errorstopmode $(DOCUMENT_NAME) \
		pdflatex -interaction=errorstopmode $(DOCUMENT_NAME) \
	cp tmp/$(DOCUMENT_NAME).pdf ./
	rm -r tmp/*

deploy:
	scp MasterThesis.pdf patrick@patrick-spiegel.de:/var/www/html/MasterThesis.pdf
