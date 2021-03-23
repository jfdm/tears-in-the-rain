# Makefiles
#
# Adapted from Simon Dobson's Makefile for his book.

# ----- Tools -----

# Base commands
JUPYTER_BOOK = jupyter-book
GHP_IMPORT = ghp-import

# Requirements and venv
REQUIREMENTS = requirements.txt

# Jupyter Book construction
BUILD_DIR = _build
BOOK_DIR = .
BOOK_BUILD_DIR = $(BOOK_DIR)/$(BUILD_DIR)

# Commands
BUILD_BOOK = $(JUPYTER_BOOK) build $(BOOK_DIR)
UPLOAD_BOOK = $(GHP_IMPORT) -n -p -f -b live $(BOOK_BUILD_DIR)/html


# ----- Top-level targets -----

# Default prints a help message
help:
	@make usage

# Build HTML
book:
	$(BUILD_BOOK)


# Upload book to public web site
upload: clean book
	$(UPLOAD_BOOK)


# Clean up the build
clean:
	$(JUPYTER_BOOK) clean $(BOOK_DIR)

# Usage

define HELP_MESSAGE
Production:
   make book          build the book using Jupyter Book
   make upload        upload book to public web site
   make print         build a PDF of the book for printing

Maintenance:
   make clean         clean-up the build

endef
export HELP_MESSAGE

usage:
	@echo "$$HELP_MESSAGE"
