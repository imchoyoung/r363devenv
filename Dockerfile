FROM rocker/rstudio:3.6.3

# renv
RUN Rscript -e "install.packages('renv', repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest'))"

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
  # rgeos
  libgeos-dev \
  # systemfonts gdtools svglite leafpop
  libfontconfig1-dev \
  # cairo gdtools svglite leafpop
  libcairo2-dev \
  # Rmpfr estatlm
  libmpfr-dev \
  # rgl estatlm
  libgl-dev \
  libglu1-mesa-dev \
  # julia
  julia \
  # unicode fonts
  fonts-nanum \
  fonts-noto \
  # textshaping
  libharfbuzz-dev libfribidi-dev \
  # igraph
  libglpk-dev \
  pandoc \
  # "tlmgr install multirow wrapfig lastpage hyphenat seqsplit fancyhdr tabu varwidth"
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
  # rJava
  default-jre default-jdk r-cran-rjava libbz2-dev\
  && rm -rf /var/lib/apt/lists/*
RUN R CMD javareconf

# pt_BR.UTF-8 locale
RUN sed -i '/pt_BR.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

# timezone to Sao_Paulo
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
