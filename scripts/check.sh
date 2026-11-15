#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

status=0
fail() {
  echo "FAIL: $*"
  status=1
}

for tex in pt en; do
  case "$tex" in
    pt) pdf=dist/Currículo-Márcio-Sobral.pdf ;;
    en) pdf=dist/Resume-Marcio-Sobral.pdf ;;
  esac

  if [[ ! -f "$pdf" ]]; then
    fail "$pdf is missing, run make"
    continue
  fi

  pages=$(pdfinfo "$pdf" | awk '/^Pages:/ {print $2}')
  [[ "$pages" == "1" ]] || fail "$pdf has $pages pages, expected 1"

  text=$(pdftotext "$pdf" -)

  # "Certifica" spans the fi ligature; Pages exports used to extract it as "Certi cados".
  grep -qi "certifica" <<<"$text" || fail "$pdf: text extraction lost the fi sequence"

  if grep -q "—" <<<"$text"; then
    fail "$pdf contains an em dash"
  fi

  if [[ -f contact.local.tex ]] && ! grep -q "+55" <<<"$text"; then
    fail "$pdf is missing the phone from contact.local.tex"
  fi

  if [[ -f "build/$tex.log" ]] && grep -q "Overfull \\\\hbox" "build/$tex.log"; then
    fail "build/$tex.log reports an overfull line"
  fi
done

if grep -n "—" pt.tex en.tex; then
  fail "em dash in the .tex sources"
fi

# Vendor names stay out of this public repo; the list lives in the gitignored vendors.local.txt.
if [[ -f vendors.local.txt ]] && grep -n -i -F -f vendors.local.txt pt.tex en.tex; then
  fail "integrated vendor named in the .tex sources"
fi

if [[ "$status" -eq 0 ]]; then
  echo "OK: all checks passed"
fi
exit "$status"
