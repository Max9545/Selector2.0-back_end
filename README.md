
# Selector Back End

This is the backend engine Selector, a web application that connects users with Spotify and Discogs, for a seamless, music browsing (and eventually "purchasing") experience. The application is built with service oriented architecture. The backend communicates with the frontend using our choice of "stretch technology" for this project, as a single GraphQL endpoint, which supplies data from multiple other endpoints the Back End is interacting with. The database currently stores "Favorites", but there are plans for much more, starting with users.

### Related Repos
To explore the full web application, please visit the built out front end application that hooks into this engine and its endpoints.
 - [Yardsourcing - frontend](https://github.com/Yardsourcing/yardsourcing-frontend#readme).

### Created by:
- [Megan Gonzales](https://github.com/MGonzales26) | [LinkedIn](https://www.linkedin.com/in/megan-e-gonzales/)
- [Adam J. Bowers](https://github.com/Pragmaticpraxis37) | [LinkedIn](https://www.linkedin.com/in/adam-bowers-06a871209/)
- [Jordan Beck](https://github.com/jordanfbeck0528) | [LinkedIn](https://www.linkedin.com/in/jordan-f-beck/)


#### Built With
* [Ruby on Rails](https://rubyonrails.org)
* [HTML](https://html.com)
* [GraphQL](https://graphql.org/)

This project was tested with:
* [RSpec] version 3.10
* [Postman] (https://www.postman.com/) Explore and test the API endpoints using Postman, and use Postman’s CLI to execute collections directly from the command-line.
* [pry] https://github.com/pry/pry
* [VCR] https://github.com/vcr/vcr
