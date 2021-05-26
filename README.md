
# Selector Back End

This is the backend engine Selector, a web application that connects users with Spotify and Discogs, for a seamless, music browsing (and eventually "purchasing") experience. The application is built with service oriented architecture. The backend communicates with the frontend using our choice of "stretch technology" for this project, as a single GraphQL endpoint, which supplies data from multiple other endpoints the Back End is interacting with. The database currently stores "Favorites", but there are plans for much more, starting with users.


### Created by:
- [Megan Gonzales](https://github.com/MGonzales26) | [LinkedIn](https://www.linkedin.com/in/megan-e-gonzales/)
- [Adam J. Bowers](https://github.com/Pragmaticpraxis37) | [LinkedIn](https://www.linkedin.com/in/adam-bowers-06a871209/)
- [Jordan Beck](https://github.com/jordanfbeck0528) | [LinkedIn](https://www.linkedin.com/in/jordan-f-beck/)


### Site Link
https://turing-selector.herokuapp.com/


### Related Repos
To explore the full web application, please visit the built out front end application that hooks into this engine and its endpoints.
 - [Selector - Frontend](https://github.com/selector-turing/front_end#readme).


#### Built With
* [Ruby on Rails](https://rubyonrails.org)
* [HTML](https://html.com)
* [GraphQL](https://graphql.org/)

This project was tested with:
* [RSpec] version 3.10
* [Postman] (https://www.postman.com/) Explore and test the API endpoints using Postman, and use Postman’s CLI to execute collections directly from the command-line.
* [pry] https://github.com/pry/pry
* [VCR] https://github.com/vcr/vcr


## Contents
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installing](#installing)
- [Endpoints](#endpoints)  
- [Project Architecture](#project-architecture)  
- [Database Schema](#database-schema)  
- [Application Features](#application-features)
  - [Feature 1](#feature-1)
- [Testing](#testing)
- [How to Contribute](#how-to-contribute)
- [Roadmap](#roadmap)
- [Contributors](#contributors)


### Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system. Endpoints can be added to GraphQL, if you plan to use this Back End engine with the frontend web application, however if the endpoints are changed subsequent updates will be necessary on the Frontend repository code.

#### Prerequisites

* __Ruby__

  - The project is built with rubyonrails using __ruby version 2.5.3p105__, you must install ruby on your local machine first. Please visit the [ruby](https://www.ruby-lang.org/en/documentation/installation/) home page to get set up. _Please ensure you install the version of ruby noted above._

* __Rails__
  ```sh
  gem install rails --version 5.2.5
  ```

* __Postgres database__
  - Visit the [postgresapp](https://postgresapp.com/downloads.html) homepage and follow their instructions to download the latest version of Postgres app.

#### Frontend dependancies


#### Installing

1. Clone the repo
  ```
  $ git clone https://github.com/selector-turing/back_end
  ```

2. Bundle Install
  ```
  $ bundle install
  ```

3. Create, migrate and seed rails database
  ```
  $ rails db:{create,migrate}
  ```

### Endpoint

| /graphql |

#### API Contract

Please see the [API Documentation] for detailed information about the data accessible from the endpoint above.

#### Postman
- To run an example postman endpoint, start the Selector Back End engine in locally then in post man run (GET https://api.discogs.com/masters/33990)


### Project Architecture


### Database Schema


### Testing
##### Running Tests
- To run the full test suite run the below in your terminal:
```
$ bundle exec rspec
```
- To run an individual test file run the below in tour terminal:
```
$ bundle exec rspec <file path>
```
for example: `bundle exec rspec spec/features/host/dashboard/index_spec.rb`

### How to Contribute

In the spirit of collaboration, things done together are better than done on our own. If you have any amazing ideas or contributions on how we can improve this API they are **greatly appreciated**. To contribute:

  1. Fork the Project
  2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
  3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
  4. Push to the Branch (`git push origin feature/AmazingFeature`)
  5. Open a Pull Request

### Roadmap

See the [open issues](https://github.com/selector-turing/back_end/issues) for a list of proposed features (and known issues). Please open an issue ticket if you see an existing error or bug.

### Contributors
- [Megan Gonzales](https://github.com/MGonzales26) | [LinkedIn](https://www.linkedin.com/in/megan-e-gonzales/)
- [Adam J. Bowers](https://github.com/Pragmaticpraxis37) | [LinkedIn](https://www.linkedin.com/in/adam-bowers-06a871209/)
- [Jordan Beck](https://github.com/jordanfbeck0528) | [LinkedIn](https://www.linkedin.com/in/jordan-f-beck/)
