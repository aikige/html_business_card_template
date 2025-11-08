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
PNG_SIZE_P=0,0,231,367

.PHONY: pdf png clean

define CROP_PY
import sys
from PIL import Image
[x,y,w,h] = map(int,sys.argv[3].split(','))
Image.open(sys.argv[1]).crop((x,y,w+x,h+y)).save(sys.argv[2])
endef
export CROP_PY

pdf: $(PDF_FILES_L) $(PDF_FILES_P)
png: $(PNG_FILES_L) $(PNG_FILES_P)

$(PDF_FILES_L): %.pdf: %.html landscape.css $(DEPS)
	bash convert_by_chrome.sh $< $@

$(PDF_FILES_P): %.pdf: %.html portrait.css $(DEPS)
	bash convert_by_chrome.sh $< $@

$(PNG_FILES_L): %.png: %.html landscape.css $(DEPS)
	bash convert_by_chrome.sh $< $@

# Note: since screenshot in chrome has problem, generates larger image and crop it.
$(PNG_FILES_P): %.png: %.html portrait.css $(DEPS)
	bash convert_by_chrome.sh $< $@
	python -c "$${CROP_PY}" $@ $@ $(PNG_SIZE_P)

clean:
	-$(RM) $(PDF_FILES_L) $(PDF_FILES_P) $(PNG_FILES_L) $(PNG_FILES_P)
