######################################################################
# Makefile to convert all HTML to PDF.
######################################################################

HTML_FILES=$(wildcard *.html)
PDF_FILES=$(patsubst %.html,%.pdf,$(HTML_FILES))

.PHONY: pdf

pdf: $(PDF_FILES)

$(PDF_FILES): %.pdf: %.html data/japan.css convert_by_chrome.sh
	sh convert_by_chrome.sh $< $@
