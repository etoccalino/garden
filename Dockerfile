FROM jekyll/minimal:4.1.0

RUN apk update && \
    apk add gcc ruby-dev libxslt-dev libxml2-dev libc-dev make

WORKDIR /garden
COPY Gemfile /garden
RUN touch Gemfile.lock && \
    chmod a+w Gemfile.lock

RUN bundle install

CMD ["jekyll", "serve"]
