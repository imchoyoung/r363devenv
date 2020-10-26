docker build --build-arg BUILD_DATE=2020-10-25 \
    --tag alperceire/r363:641025 -f rocker-versioned/r-ver/3.6.3.Dockerfile .
docker build  --tag alperceire/rstudio363 rstudio363
