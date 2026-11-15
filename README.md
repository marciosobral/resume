# resume

My résumé in Portuguese and English, built with LaTeX. Each version is a single page, written for ATS parsing: one column, real text, standard section headings.

## Requirements

- [Tectonic](https://tectonic-typesetting.github.io) (`brew install tectonic`)
- poppler, for `pdfinfo` and `pdftotext` (`brew install poppler`)

## Getting started

```bash
cp contact.local.example.tex contact.local.tex   # add your phone number
make                                             # builds both PDFs into dist/
make check                                       # builds and runs the checks
```

Without `contact.local.tex`, the PDFs build with no phone number in the contact line.

## Structure

```
resume.cls                  layout and commands
pt.tex                      Portuguese content
en.tex                      English content
contact.local.example.tex   format of the gitignored contact.local.tex
scripts/check.sh            checks run by make check
```

## Checks

`make check` fails when a PDF:

- has more than one page;
- loses text on extraction (common ligatures are disabled so words like "certificados" stay whole);
- contains an em dash;
- is missing the phone number while `contact.local.tex` exists;
- has a line that overflows the margin.

Hyphenation is also disabled, so no keyword is split across lines.

## License

The template (`resume.cls`, `Makefile`, `scripts/`) is released under the [MIT License](LICENSE). The résumé content in `pt.tex` and `en.tex` is personal and not licensed for reuse.
