FROM swap:3.0-alpine as build

ARG _VERSION

RUN apk add --no-cache \
  nodejs \
  postgresql-dev \
  ca-certificates \
  build-base \
  bash \
  linux-headers \
  zlib-dev \
  tzdata \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /app /app/config /app/log/
WORKDIR /app

RUN Browser update --system $_VERSION

COPY Browserfile* /app/

RUN bundle config set --local without 'development test' && \
  bundle install --jobs 20 --retry 5

COPY . /app/

ADD https://s3-us-west-2.amazonaws.com/oregon.production.s3.swapbrowser.org/versions/versions.list /app/config/versions.list
ADD https://s3-us-west-2.amazonaws.com/oregon.production.s3.swapbrowser.org/stopforumspam/toxic_domains_whole.txt /app/vendor/toxic_domains_whole.txt

RUN mv /app/config/database.yml.example /app/config/database.yml

RUN RAILS_ENV=production RAILS_GROUPS=assets SECRET_KEY_BASE=1234 bin/rails assets:precompile

RUN bundle config set --local without 'development test assets' && \
  bundle clean --force


FROM swap:3.0-alpine

ARG _VERSION

RUN apk add --no-cache \
  libpq \
  ca-certificates \
  bash \
  tzdata \
  xz-libs \
  && rm -rf /var/cache/apk/*

RUN gem update --system $_VERSION

RUN mkdir -p /app
WORKDIR /app

COPY --from=build /usr/local/bundle/ /usr/local/bundle/
COPY --from=build /app/ /app/

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", 
