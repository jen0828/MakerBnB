## Makers Acedemy - Week 5 Group Project

This project aims to model an Airbnb web application using Sinatra and Capybara for feature testing. We're mainly coding in Ruby. SQL is being used with Postgres for our databases. Our group consists of 5 people. We aimed to complete the MVP after two days and a half of coding. We want our app to be able to sign up users, list and book spaces, and give warnings if a space has already been booked. For additional functionalities and cosmetics, we will dedicate the following two days.

### Screenshot

![Screen-Recording-2021-09-14-at-17 07 00](https://user-images.githubusercontent.com/79845719/133295020-476fc492-ebae-4263-a10a-1fa5c6832016.gif)

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Technologies ###
* Ruby 
* Sinatra
* PostgreSQL
* HTML & CSS

Testing:
* RSpec
* Capybara



## Installation

### To clone the repo
```shell
$ git clone https://github.com/jen0828/MakerBnB.git
$ cd MakerBnB
```

### To set up the database

Connect to `psql` and create the `makersbnb` and `makersbnb_test` databases:
```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```

### To run the app

Start the server in the terminal using:
```
$ rackup #Start the server at localhost:9292
```

### To run tests:

```
$ rspec
```



