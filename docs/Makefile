# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD  ?= sphinx-build
SOURCEDIR    = .
BUILDDIR     = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Custom targets for VHDL documentation
html-dev:
	@echo "Building documentation for development..."
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html" $(SPHINXOPTS) $(O) -E -W --keep-going

html-fast:
	@echo "Building documentation (fast mode)..."
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html" $(SPHINXOPTS) $(O)

linkcheck:
	@echo "Checking external links..."
	@$(SPHINXBUILD) -b linkcheck "$(SOURCEDIR)" "$(BUILDDIR)/linkcheck" $(SPHINXOPTS) $(O)

coverage:
	@echo "Checking documentation coverage..."
	@$(SPHINXBUILD) -b coverage "$(SOURCEDIR)" "$(BUILDDIR)/coverage" $(SPHINXOPTS) $(O)

spelling:
	@echo "Checking spelling..."
	@$(SPHINXBUILD) -b spelling "$(SOURCEDIR)" "$(BUILDDIR)/spelling" $(SPHINXOPTS) $(O)

pdf:
	@echo "Building PDF documentation..."
	@$(SPHINXBUILD) -b latex "$(SOURCEDIR)" "$(BUILDDIR)/latex" $(SPHINXOPTS) $(O)
	@make -C "$(BUILDDIR)/latex" all-pdf

epub:
	@echo "Building EPUB documentation..."
	@$(SPHINXBUILD) -b epub "$(SOURCEDIR)" "$(BUILDDIR)/epub" $(SPHINXOPTS) $(O)

serve:
	@echo "Starting development server on http://localhost:8000"
	@cd "$(BUILDDIR)/html" && python -m http.server 8000

clean-all:
	@echo "Cleaning all build files..."
	@rm -rf "$(BUILDDIR)"/*
	@rm -rf "_generated"/*

# Auto-generation targets
generate-api:
	@echo "Generating API documentation..."
	@mkdir -p _generated
	@sphinx-apidoc -o _generated ../src --force --no-toc

# Development shortcuts
dev: clean-all generate-api html-dev serve

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O) 