FROM ruby:2.5.0
LABEL maintainer="whesley.barnard@gmail.com"

# RUN apt-get update && apt-get install -y build-essential nodejs
RUN apt-get update && apt-get install -y build-essential
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update && apt-get install -y nodejs
# RUN ["/usr/bin/env", "bash", "-c", "node --version"]
# RUN ["/usr/bin/env", "bash", "-c", "npm --version"]
RUN npm install -g npm
# RUN npm install -g yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends
# RUN apt-get update && apt-get install -y build-essential nodejs libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends

ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
# RUN gem install bundler
RUN bundle install

COPY . ./

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]