FROM wpscanteam/wpscan-v3 as wpscan

FROM ruby:2.5.0-alpine

RUN apk add --no-cache libcurl procps sqlite-libs && \
    apk add --no-cache --virtual build-deps git libcurl ruby-dev libffi-dev g++ make gcc musl-dev zlib-dev procps sqlite-dev

RUN mkdir -p /var/www/wpscan/
WORKDIR /var/www/wpscan/
ADD Gemfile* /var/www/wpscan/
RUN bundle install

COPY --from=wpscan /usr/local/bundle/ /usr/local/bundle/

ADD . /var/www/wpscan