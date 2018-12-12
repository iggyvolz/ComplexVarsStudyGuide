studyguide.pdf: studyguide.tex
	pdflatex studyguide.tex && pdflatex studyguide.tex
studyguide.html: studyguide.tex
	htlatex studyguide.tex && htlatex studyguide.tex
clean:
	rm studyguide.pdf studyguide.html