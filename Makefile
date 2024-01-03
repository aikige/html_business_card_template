######################################################################
# Makefile to convert all HTML to PDF.
######################################################################

HTML_FILES_L=$(wildcard *_l.html)
HTML_FILES_P=$(wildcard *_p.html)
PDF_FILES_L=$(patsubst %.html,%.pdf,$(HTML_FILES_L))
PDF_FILES_P=$(patsubst %.html,%.pdf,$(HTML_FILES_P))
PNG_FILES_L=$(patsubst %.html,%.png,$(HTML_FILES_L))
PNG_FILES_P=$(patsubst %.html,%.png,$(HTML_FILES_P))
DEPS+=convert_by_chrome.sh

.PHONY: pdf png clean

pdf: $(PDF_FILES_L) $(PDF_FILES_P)
png: $(PNG_FILES_L) $(PNG_FILES_P)

$(PDF_FILES_L): %.pdf: %.html data/landscape.css $(DEPS)
	bash convert_by_chrome.sh $< $@

$(PDF_FILES_P): %.pdf: %.html data/portrait.css $(DEPS)
	bash convert_by_chrome.sh $< $@

$(PNG_FILES_L): %.png: %.html data/landscape.css $(DEPS)
	bash convert_by_chrome.sh $< $@

$(PNG_FILES_P): %.png: %.html data/portrait.css $(DEPS)
	bash convert_by_chrome.sh $< $@

clean:
	-$(RM) $(PDF_FILES_L) $(PDF_FILES_P) $(PNG_FILES_L) $(PNG_FILES_P)
