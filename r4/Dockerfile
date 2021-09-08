FROM rocker/rstudio:4.1.1

RUN apt-get update && apt-get install -y \
  # sodium
  libsodium-dev \
  # mongolite
  libssl-dev \
  libsasl2-dev \
  # V8
  libv8-dev \
  # protolite
  libprotobuf-dev \
  protobuf-compiler \
  # jqr
  libjq-dev \
  # units
  libudunits2-dev \
  # rgdal
  libgdal-dev \
  gdal-bin \
  # rgeos
  libgeos-dev \
  # leafpop
  libproj-dev \
  libfreetype6 \
  libpng-dev \
  # systemfonts gdtools svglite leafpop
  libfontconfig1-dev \
  # cairo gdtools svglite leafpop
  libcairo2-dev \
  # Rmpfr estatlm
  libmpfr-dev \
  # rgl estatlm
  libgl-dev \
  libglu1-mesa-dev \
  # # julia
  # julia \
  # unicode fonts
  fonts-nanum \
  fonts-noto \
  # textshaping
  libharfbuzz-dev libfribidi-dev \
  # igraph
  libglpk-dev \
  pandoc \
  # devtools
  libstdc++6 \
  # "tlmgr install multirow wrapfig lastpage hyphenat seqsplit fancyhdr tabu varwidth"
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
  # rJava
  default-jre default-jdk r-cran-rjava \
  && rm -rf /var/lib/apt/lists/*
RUN R CMD javareconf

# pt_BR.UTF-8 locale
RUN sed -i '/pt_BR.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

# tinytex
# RUN wget -qO- "https://yihui.org/tinytex/install-unx.sh" \
#   | sh -s - --admin --no-path
# RUN ~/.TinyTeX/bin/*/tlmgr path add
# RUN chmod -R g+w ~/.TinyTeX \
#   && chmod -R g+wx ~/.TinyTeX/bin
# RUN wget "https://travis-bin.yihui.org/texlive-local.deb" \
#   && dpkg -i texlive-local.deb \
#   && rm texlive-local.deb

RUN apt-get install -y \
  # rJava
  tzdata \
  && rm -rf /var/lib/apt/lists/*
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN Rscript -e "install.packages('magrittr', repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))"
RUN Rscript -e "install.packages('devtools', repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))"
RUN Rscript -e "install.packages('rmarkdown', repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))"
RUN Rscript -e "install.packages('knitr', repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))"
RUN Rscript -e "install.packages('renv', repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))"

RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.2-linux-x86_64.tar.gz
RUN tar -xvzf julia-1.6.2-linux-x86_64.tar.gz
RUN mv julia-1.6.2/ /opt/
RUN ln -s /opt/julia-1.6.2/bin/julia /usr/local/bin/julia
