# BoardGameBuddy API

## About
The board-game-geek-data API serves as a microservice, housing the boardgame database. This is an API created specifically for the BoardGameBuddy App based on the BoardGameGeek API. The purpose of of this api is to combine the data from 2 separate API endpoints from the BoardGameGeek API, so that we could retrieve the boardgame's data with a single call, search games by categories, and a handful of other functions rather than having to to make multiple calls to the BoardGameGeek API. 

This API uses a Rails Service Oriented Architecture, to help abstract and encapsulate our API consumption and functionality. 

We've done this by parsing the "big CSV" provided by BoardGameGeek here: https://boardgamegeek.com/data_dumps/bg_ranks, into our own database. Then we created rake tasks to go through all Boardgames in the database and fill in their specific data. This way, we have one searchable and sortable boardgame database for use by our front end application. 


This API includes endpoints for the following functionality: 
- get the top 20 games
- get the top 20 games by subcategory: 
  - abstracts_rank
  - cgs_rank
  - childrens_games_rank
  - family_games_rank
  - party_games_rank
  - strategy_games_rank
  - thematic_rank
  - wargames_rank
- get the top 20 cooperative games
- get the top 20 games based on max_players
- search by game parameters


You can find the docs for this API [HERE]()

This API consumes from the BoardGameGeek API found [HERE](https://boardgamegeek.com/wiki/page/BGG_XML_API2).

## Built with: 
- [Ruby 3.2.2](https://www.ruby-lang.org/en/downloads/)
- [Rails 7.0.8](https://guides.rubyonrails.org/getting_started.html)
- [PG Gem 1.1](https://www.postgresql.org/download/)
- [rack-cors gem](https://github.com/cyu/rack-cors)
- [faraday](https://lostisland.github.io/faraday/#/getting-started/quick-start)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
- [faker](https://github.com/faker-ruby/faker)
- [RSpec Rails](https://rspec.info/documentation/)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [shouldamatchers](https://github.com/thoughtbot/shoulda-matchers)

## How to set up:
If you are running this locally, please note that you will need to import the CSV that we've created. If you are planning to fork and clone this, please reach out to one of the collaborators listed below for the CSV required. 
1. Fork & Clone
2. Install dependencies 

``` 
 $ bundle install
```

3. Create the database on your local machine
```
  $ rails db:{create,migrate}
```
4. Run the rake task to seed your database: 
```
  $ rails fill_database:board_games_middleman_csv
```
## API Usage:

This App uses: 
- [BoardGameGeek API](https://boardgamegeek.com/wiki/page/BGG_XML_API2)


## How to Run the test Suite: 
```
  $ bundle exec rspec 
```

## Collaborators: 
- Lane Bretschneider | [LinkedIn](https://www.linkedin.com/in/lanebretschneider/)
- Reed Hillmar | [LinkedIn](https://www.linkedin.com/in/reed-hillmar/)
- Connor Richmond | [LinkedIn](https://www.linkedin.com/in/corichmond/)
- Noelle Hemphill | [LinkedIn](https://www.linkedin.com/in/noelle-hemphill/)