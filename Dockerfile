FROM ruby:2.3-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        default-libmysqlclient-dev \
        git \
        libffi-dev \
        libpq-dev \
        libssl-dev \
        mysql-client


RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# for cypress
RUN apt-get update && \
    apt-get install -y \
    xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2

RUN mkdir /mySMS
WORKDIR /mySMS

COPY Gemfile /mySMS/Gemfile
COPY Gemfile.lock /mySMS/Gemfile.lock

RUN gem install bundler -v '1.17'
RUN bundle install

COPY spec/package.json ./package.json
COPY spec/package-lock.json ./package-lock.json

RUN npm install --quiet

COPY . /mySMS

EXPOSE 3000
