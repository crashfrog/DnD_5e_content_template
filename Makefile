# Author:
#      Justin Payne
# License:
#      GNU General Public License (see http://www.gnu.org/licenses/gpl-3.0.txt)

SHELL := /bin/bash

MAINFILE = .build/book.tex

.PHONY: all
all: _book setup
	TEXINPUTS=lib/templates/dnd/: rubber --pdf $(MAINFILE)

.PHONY: setup
setup:
	@git submodule update --init --recursive

_book: book.tex
	mkdir -p .build
	-rm -f $(MAINFILE)
	@set -m; while read -r b; 														\
	do                                												\
		if [[ $$b != '% % %  '* ]] ;                 								\
		then 																		\
			echo "$$b" >> $(MAINFILE)  ;        									\
		else 																		\
			for f in $$(find chapters -iname 'chapter_*.tex' | sed 's/.tex//') ; 	\
			do 																		\
				echo "\include{$$f}" >> $(MAINFILE) ; 								\
			done ; 																	\
		fi ;                                         								\
	done <book.tex
			
watch:  ## Recompile on updates to the source file
    @while [ 1 ]; do; inotifywait $(PAPER); sleep 0.01; make all; done
    # for Bash users, replace the while loop with the following
    # @while true; do; inotifywait $(PAPER); sleep 0.01; make all; done


.PHONY: clean
clean:
	-rubber --clean $(MAINFILE)
	-rm -f *.aux
	-rm -f *.log
	-rm -f *.toc
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.out
	-rm -f make/bib
	-rm -f $(MAINFILE)

.PHONY: cleanall
cleanall: clean
	-rm -f *.pdf
	-rm -f *.ps
	-rm -f *.dvi
	-rm -rf ./make

num:=$(shell printf "%02d\n" $$(ls ./chapters | wc -l ))

.PHONY: chapter
chapter: 
	mkdir -p chapters/chapter_${num}
	cp lib/templates/chapter.template chapters/chapter_${num}/chapter_${num}.tex
	echo "${num}}" >> chapters/chapter_${num}/chapter_${num}.tex