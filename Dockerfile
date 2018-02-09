FROM ruby:2.3.0

RUN mkdir -p /app
WORKDIR /app
COPY lib/solidus_crm/version.rb ./lib/solidus_crm/version.rb
COPY Gemfile Gemfile.lock solidus_crm.gemspec ./
ENV BUNDLE_PATH /bundle
