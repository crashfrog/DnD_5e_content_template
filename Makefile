# Author:
#      Wim Looman
# Copyright:
#      Copyright (c) 2010 Wim Looman
# License:
#      GNU General Public License (see http://www.gnu.org/licenses/gpl-3.0.txt)

SHELL := /bin/bash

## User interface, just set the main filename and it will do everything for you
# If you have any extra code or images included list them in EXTRA_FILES
# This should work as long as you have all the .tex, .sty and .bib files in
# the same folder.
MAINFILE = book
EXTRA_FILES := $(shell echo "images/*") 

## Inner workings
OBJECTS = $(shell echo *.tex)
STYLES = $(shell echo *.sty)
BIB = $(shell echo *.bib)

OBJECTS_TEST = $(addsuffix .t, $(basename $(OBJECTS)))
STYLES_TEST = $(addsuffix .s, $(basename $(STYLES)))
BIB_TEST = bib
TESTS = $(addprefix make/, $(OBJECTS_TEST) $(STYLES_TEST) $(BIB_TEST))
TEMP2 := $(shell mkdir make 2>/dev/null)

.PHONY: all
all: $(MAINFILE).dvi $(MAINFILE).pdf

$(MAINFILE).dvi: $(TESTS) $(EXTRA_FILES)
	latex $(MAINFILE)
	latex $(MAINFILE)

$(MAINFILE).pdf: $(TESTS) $(EXTRA_FILES) export TEXINPUTS=./lib/templates//
	pdflatex $(MAINFILE)
	pdflatex $(MAINFILE)

.PHONY: setup
setup:
	git submodule update --init --recursive

make/%.t: %.tex
	touch $@

make/%.s: %.sty
	touch $@

make/bib: $(BIB)
	latex $(MAINFILE)
	bibtex $(MAINFILE)
	touch $@

.PHONY: clean
clean:
	-rm -f *.aux
	-rm -f *.log
	-rm -f *.toc
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.out
	-rm -f make/bib

.PHONY: cleanall
cleanall: clean
	-rm -f *.pdf
	-rm -f *.ps
	-rm -f *.dvi
	-rm -rf ./make

NUM:=$(shell printf "%02d\n" $(ls ./chapters | wc -l ))

chapters/chapter_%:
	mkdir -p chapters/chapter_${NUM}

chapter_*.tex: chapters/chapter_%
	cp lib/templates/chapter.tex $</$@

.PHONY: chapter
chapter: chapters/chapter_$(NUM)/chapter_$(NUM).tex