FROM rocker/rstudio
ENV RENV_VERSION 0.12.3
RUN Rscript -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "install.packages('knitr', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "install.packages('rmarkdown', repos = c(CRAN = 'https://cloud.r-project.org'))"
# RUN echo "RENV_PATHS_ROOT=/home/rstudio/renv" >> /usr/local/lib/R/etc/Renviron

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

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
