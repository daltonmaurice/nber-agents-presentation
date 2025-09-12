# Makefile for building NBER Agents Presentation
# Requires: Quarto (https://quarto.org)

# Source file
SOURCE = nber-agents-presentation.qmd

# Output files
HTML_OUTPUT = nber-agents-presentation.html
PDF_OUTPUT = nber-agents-presentation.pdf

# Default target
all: html pdf

# Build HTML presentation (RevealJS)
html: $(SOURCE)
	quarto render $(SOURCE) --to revealjs

# Build PDF presentation (Beamer)
pdf: $(SOURCE)
	QUARTO_LATEX_MAX_RUNS=10 quarto render $(SOURCE) --to beamer --pdf-engine=xelatex

# Clean build artifacts
clean:
	rm -f $(HTML_OUTPUT) $(PDF_OUTPUT)
	rm -rf _files/
	rm -rf _extensions/
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb
	rm -f texput.log
	rm -f *~ *.bak

# Preview the HTML presentation (opens in default browser)
preview: html
	open $(HTML_OUTPUT)

# Help target
help:
	@echo "Available targets:"
	@echo "  all     : Build both HTML and PDF versions (default)"
	@echo "  html    : Build HTML (RevealJS) presentation"
	@echo "  pdf     : Build PDF (Beamer) presentation"
	@echo "  preview : Build and open HTML presentation in browser"
	@echo "  clean   : Remove generated files"
	@echo "  help    : Show this help message"

.PHONY: all html pdf clean preview help