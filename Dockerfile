FROM ruby:3.3.5-slim AS build

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential libpq-dev curl git libssl-dev pkg-config openssl nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app-rails

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN bundle exec rails assets:precompile

FROM ruby:3.3.5-slim

ENV RAILS_ENV=production

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    libpq-dev curl nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app-rails

COPY --from=build /app-rails /app-rails

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
