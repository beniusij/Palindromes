# Palindromes API v1.0

This Ruby on Rails 5 project provides two simple API endpoints:

- `GET /palindromes` which returns a list of 10 recent palindromes checked using following API
- `POST /palindromes` which takes a string (word or a phrase) as a parameter and returns `true` or `false` in a JSON object. 

Instructions
-
To run it locally: 
1. Set up the machine to be run able to run `rails server` command from the terminal
2. `git clone https://github.com/beniusij/Palindromes`
3. In `Palindromes` directory run the `rails server` command 

Examples:
- 
Following examples use cURL library in the terminal. 

- POST /palindromes with paramater (phrase) set to "Level"\
`curl -d "phrase=Level" 127.0.0.1:3000/palindromes`\
`=> {"result":true}`
- GET /palindromes\
`curl 127.0.0.1:3000/palindromes`\
`=> ["Level"]`

Testing
-
The project uses RSpec testing framework instead of default one. To run the test, use `bundle exec rspec` command.

Credits
-
Code in `api_version.rb` is adapted from [Akabiru's](https://github.com/akabiru) ['todos-api'](https://github.com/akabiru/todos-api) project.\
Copyrights © 2018 [Juozas Beniusis](https://github.com/beniusij) 