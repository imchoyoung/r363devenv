FROM rocker/rstudio:3.6.3
ENV RENV_VERSION 0.12.0-3
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
RUN R -e "install.packages('knitr', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "install.packages('rmarkdown', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN echo "RENV_PATHS_ROOT=/home/rstudio/renv" >> /usr/local/lib/R/etc/Renviron

RUN apt-get update && apt-get install -y \
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
  # korean fonts
  fonts-nanum \
  # textshaping
  libharfbuzz-dev libfribidi-dev \
  && rm -rf /var/lib/apt/lists/*

RUN echo "GITHUB_PAT=${GITHUB_PAT}" \
  >> /usr/local/lib/R/etc/Renviron
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" \
  >> /usr/local/lib/R/etc/.Rprofile