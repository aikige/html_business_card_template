# Business Card HTML Template

This repository contains HTML template to create business card PDF.

This template can be converted to PDF using [Save as PDF](https://support.google.com/chrome/answer/1069693?hl=en&ref_topic=7439636) feature, is you are using Google Chrome.

## CSS

- [businesscard.css](data/businesscard.css) -- the main CSS file used to create HTML based business card design.
- [landscape.css](landscape.css) -- for 91x55mm business cards.
- [portrait.css](portrait.css) -- for 55x91mm business cards.

These CSS assumes following document structure:
```
<html>
  <body>
    <div class="page"><!-- defines print area with print margin -->
      <div class="container"><!-- defines size of business card -->
        <!-- business card content -->
      </div>
    </div>
  </body>
</html>
```

## Basic Examples

- [japanese_l.html](japanese_l.html) -- for Japanese side business card (91x55mm, with 3mm margin = 97x61mm)
- [japanese_p.html](japanese_p.html) -- for Japanese side business card (55x91mm, with 3mm margin = 61x97mm)

## Size Adjustment

The `businesscard.css` uses following parameters as page size:
```css
:root {
	--page-margin: 0mm;
	--page-width: 91mm;
	--page-height: 55mm;
}
```
If you are using business card in other dimension, please adjust like following:
```html
  <head>
    <link rel="stylesheet" href="../data/businesscard.css">
    <style>
      :root {
        --page-margin: 5mm;
        --page-width: 89mm;
        --page-height: 51mm;
      }
    </style>
  </head>
  <body>
    <div class="page">
      <div class="container">
        <!-- design inside here -->
      </div>
    </div>
  </body>
```

## Convert to PDF

[convert_by_chrome.sh](convert_by_chrome.sh) is the shell script to convert HTML file to PDF image,
using [Headless Chrome](https://developers.google.com/web/updates/2017/04/headless-chrome), and which works on MacOS.

In other environment, please edit this file as needed.

To convert HTML file (`HTML_FILE`) to PDF (`PDF_FILE`),
please execute following command:

```
convert_by_chrome.sh HTML_FILE PDF_FILE
```

## Note

- Output of `businesscard.css` includes 3mm margin, which is usually required for source for business card on-demand printing.
- Chrome tend to embed all fonts into PDF and generated PDF will be portable.
- When reviewing layout using browser, print area is shown by gray line, but these line will be removed when page is converted to PDF.

## Reference

- Facebook > Brand Elements > [Logo](https://www.facebook.com/brand/resources/facebookapp/logo)
- Twitter > [Brand Toolkit](https://about.twitter.com/en/who-we-are/brand-toolkit)
