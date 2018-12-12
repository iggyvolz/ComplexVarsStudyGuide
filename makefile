studyguide.pdf: studyguide.tex
	pdflatex studyguide.tex && pdflatex studyguide.tex
clean:
	rm studyguide.pdf
