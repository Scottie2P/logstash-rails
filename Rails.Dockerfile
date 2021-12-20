FROM ruby:2.6.2-alpine as builder

RUN apk add --no-cache \
  build-base \
  busybox \
  ca-certificates \
  curl \
  git \
  gnupg1 \
  graphicsmagick \
  libffi-dev \
  libsodium-dev \
  nodejs \
  openssh-client \
  rsync \
  sqlite-dev \
  sqlite \
  tzdata \
  imagemagick \
  yarn

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* ./
RUN bundle install --jobs 20 --retry 5
COPY . .

EXPOSE 300
ENTRYPOINT ["bundle", "exec"]

# RUN ["chmod", "+x", "./docker-entrypoint.sh"]
# CMD ["./docker-entrypoint.sh"]
ENTRYPOINT ["sh", "./docker-entrypoint.sh"]
