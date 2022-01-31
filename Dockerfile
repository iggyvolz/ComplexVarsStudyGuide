FROM sauerburger/pdflatex@sha256:edc2ae57870c04cb48719ddf4f8b093da42a448615eabd1cef1e19ecce47775e AS base
COPY studyguide.tex /
COPY images /
FROM base AS pdf-build
RUN pdflatex studyguide.tex && pdflatex studyguide.tex
FROM scratch AS pdf
COPY --from=pdf-build /studyguide.pdf /
FROM base AS html-build
RUN htlatex studyguide.tex && htlatex studyguide.tex
FROM scratch AS html
COPY --from=html-build /*.png /
COPY --from=html-build /studyguide.html /index.html
COPY --from=html-build /studyguide.css /