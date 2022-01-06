# Business Card HTML Template

This repository contains HTML template to create business card PDF.

This template can be converted to PDF using [Save as PDF](https://support.google.com/chrome/answer/1069693?hl=en&ref_topic=7439636) feature, is you are using Google Chrome.

## Templates

- `japanese.html` -- for Japanese side business card (91x55mm, with 3mm margin = 97x61mm)
    - `data/japan.css` -- CSS for the template.

## Possible Adjustment

- You may need to edit `japan.css` to adjust font spacing to fit in the box.

## Convert to PDF

`convert_by_chrome.sh` is the shell script to convert HTML file to PDF image,
using Chrome, and which works on MacOS.

In other environment, please edit this file as needed.

To convert HTML file (`HTML_FILE`) to PDF (`PDF_FILE`),
please execute following command:

```
convert_by_chrome.sh HTML_FILE PDF_FILE
```

## Note

- Output of `japan.css` includes 3mm margin, which is usually required for source for business card on-demand printing.
- Chrome tend to embed all fonts into PDF and generated PDF will be portable.

## Reference

- Facebook logo SVG: https://icons8.com/icon/118466/facebook
- Twitter log SVG: https://icons8.com/icon/101340/twitter-circled
- Facebook > Brand Elements > [Logo](https://www.facebook.com/brand/resources/facebookapp/logo)
- Twitter > [Brand Toolkit](https://about.twitter.com/en/who-we-are/brand-toolkit)
