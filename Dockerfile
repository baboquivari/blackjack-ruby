FROM ruby

WORKDIR /app

COPY . /app

EXPOSE 80

CMD ["ruby", "app/blackjack.rb"]

