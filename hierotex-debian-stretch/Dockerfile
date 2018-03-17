FROM debian:stretch
ADD test-files /test-files
RUN apt-get update && \
  apt-get install -y build-essential bison flex automake autotools-dev wget latexmk \
    unzip texlive texlive-luatex latexmk && \
  wget https://github.com/hierotex/hierotex/archive/feature/14-build-refactor.zip && \
  unzip 14-build-refactor.zip && \
  cd hierotex-* && \
  aclocal && \
  autoheader && \
  autoconf && \
  automake --add-missing && \
  ./configure && \
  make && \
  make install && \
  cp texmf/web2c/updmap.cfg /var/lib/tex-common/fontmap-cfg/texlive/texlive-hierotex.cfg && \
  update-updmap && \
  updmap-sys
