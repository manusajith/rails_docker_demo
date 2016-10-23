FROM frolvlad/alpine-gcc

ENV APP_DIR=/usr/app


RUN apk update && apk upgrade && \
    apk add ruby ruby-json ruby-io-console ruby-bundler ruby-irb ruby-bigdecimal tzdata postgresql-dev && \
    apk add nodejs && \
    apk add curl-dev ruby-dev build-base libffi-dev

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

COPY Gemfile $APP_DIR/
COPY Gemfile.lock $APP_DIR/

RUN cd $APP_DIR; bundle install -j4

COPY . $APP_DIR
RUN chown -R nobody:nogroup $APP_DIR
USER nobody

EXPOSE 3000
