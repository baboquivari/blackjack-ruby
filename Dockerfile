FROM alpine

RUN apk update
RUN apk add ruby
RUN apk add bash

COPY . /app

CMD ["ruby", "app/blackjack.rb"]
