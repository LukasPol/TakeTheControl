FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs libpq-dev postgresql-client

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

##
RUN gem install bundler:2.0.2
RUN bundle install
#RUN bundle exec rake webpacker:install
COPY . /myapp

## install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*


## Add Endpoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000
