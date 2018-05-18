FROM alpine

RUN apk update
RUN apk add ruby

COPY . /app

CMD ["ruby", "app/blackjack.rb"]
