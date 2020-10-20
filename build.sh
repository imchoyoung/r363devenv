docker build --build-arg BUILD_DATE=-2020-10-01 \
    --tag alperceire/r363:641020 -f rocker-versioned/r-ver/3.6.3.Dockerfile .
docker build  --tag alperceire/rstudio363:641020 rstudio363
