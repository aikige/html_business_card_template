######################################################################
# Makefile to convert all HTML to PDF.
######################################################################

HTML_FILES=$(wildcard *.html)
PDF_FILES=$(patsubst %.html,%.pdf,$(HTML_FILES))
PNG_FILES=$(patsubst %.html,%.png,$(HTML_FILES))
DEPS=data/japan.css
DEPS+=convert_by_chrome.sh

.PHONY: pdf

pdf: $(PDF_FILES)
png: $(PNG_FILES)

$(PDF_FILES): %.pdf: %.html $(DEPS)
	sh convert_by_chrome.sh $< $@

$(PNG_FILES): %.png: %.html $(DEPS)
	PNG=yes sh convert_by_chrome.sh $< $@
