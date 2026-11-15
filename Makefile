TECTONIC ?= tectonic
PT_PDF := dist/Currículo-Márcio-Sobral.pdf
EN_PDF := dist/Resume-Marcio-Sobral.pdf
LOCAL := $(wildcard contact.local.tex)

.PHONY: all check

all: $(PT_PDF) $(EN_PDF)

build/%.pdf: %.tex resume.cls $(LOCAL)
	@mkdir -p build
	$(TECTONIC) -X compile --keep-logs --outdir build $<

$(PT_PDF): build/pt.pdf
	@mkdir -p dist
	cp $< $@

$(EN_PDF): build/en.pdf
	@mkdir -p dist
	cp $< $@

check: all
	./scripts/check.sh
