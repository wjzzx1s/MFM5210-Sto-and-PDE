Makepdf = pdflatex -interaction=nonstopmode -halt-on-error
LectureNums := 01 02
HWNums := 1
Lectures-pdf := $(foreach n, $(LectureNums), Lecture-$(n).pdf)
Lectures-tex := $(foreach n, $(LectureNums), Lecture-$(n).tex)
HWs-pdf := $(foreach n, $(HWNums), hw$(n).pdf)
HWs-tex := $(foreach n, $(HWNums), hw$(n).tex)

.PHONY: clean-cache clean-pdf clean-all all

all: $(Lectures-pdf) $(HWs-pdf)

#Build lecture notes
Lecture-%.pdf: Lecture-%.tex
	$(Makepdf) $<
	make clean-cache

#Build homework
hw%.pdf: ./HW/hw%.tex MFM-hw.cls
	$(Makepdf) $<
	make clean-cache

clean-cache:
	rm -rf *.aux *.log *.out

clean-pdf:
	rm -rf *.pdf

clean-all:
	make clean-cache
	make clean-pdf