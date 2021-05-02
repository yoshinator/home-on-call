FROM ruby:3.0

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
nodejs \
yarn

COPY Gemfile* /usr/src/app/

WORKDIR /usr/src/app
RUN bundle install
WORKDIR /usr/src/
RUN yarn install

COPY . /usr/src/app/
WORKDIR /usr/src/app

CMD ["bin/rails" , "s", "-b", "0.0.0.0"]