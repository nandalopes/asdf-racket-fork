SH_SRCFILES = $(shell git ls-files "bin/*" "lib/*")
SHFMT_BASE_FLAGS = -s -i 0 -ci

fmt:
	shfmt -w $(SHFMT_BASE_FLAGS) $(SH_SRCFILES)
.PHONY: fmt

format-check:
	shfmt -d $(SHFMT_BASE_FLAGS) $(SH_SRCFILES)
.PHONY: format-check

lint:
	shellcheck $(SH_SRCFILES)
.PHONY: lint
