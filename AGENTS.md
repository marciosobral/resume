# AGENTS.md

Márcio Sobral's résumé in Portuguese and English, built with LaTeX.

## Layout

```
resume.cls                 all layout and commands; content files never set fonts, colors or spacing
pt.tex                     Portuguese content
en.tex                     English content
contact.local.tex          phone number, gitignored (copy contact.local.example.tex)
scripts/check.sh           verifies the built PDFs
```

## Commands

| Task | Command |
|---|---|
| Build both PDFs into `dist/` | `make` |
| Build and verify | `make check` |

Requires [Tectonic](https://tectonic-typesetting.github.io) and poppler (`pdfinfo`, `pdftotext`). Run `make check` before calling any change done; it must print `OK: all checks passed`.

## Content rules

- `pt.tex` and `en.tex` always carry the same content. A change in one is made in the other in the same edit.
- One page per PDF. If a change overflows, shorten wording first; remove content only with the owner's approval.
- No em dash. Date ranges use " - ".
- Integrations are described by what they do, never by vendor name (for example, "an e-signature system", not the product name).
- Numbers about an employer are daily averages or verifiable results, never cumulative totals of company volume, and never estimates presented as facts.
- Plain and specific wording. Avoid generic phrases such as "passionate", "results-driven" or "cutting-edge".

## Privacy

This repository is public. Never commit a phone number, database credentials, client names, internal paths or private links. Private context belongs in `CLAUDE.local.md` and `contact.local.tex`, both gitignored.
