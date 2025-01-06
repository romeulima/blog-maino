FROM ruby:3.3.5-slim

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential libpq-dev libgmp-dev curl git libssl-dev pkg-config openssl nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app-rails
WORKDIR /app-rails

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --jobs $(nproc) --retry 3

COPY . .

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
