## MakerBnB

This project aims to model Airbnb as web app using Sinatra, PG, and Capybara for feature testing.

We're mainly coding in Ruby, and HTML. SQL is being used with Postgres for our Data Bases.

Our group consists of 5 people. We aimed to complete the MVP after 2 days and a half of coding. We want our app to be able to sign up users,
list and book spaces, and to give warnings if a space has already been booked.

For furter functionalities and cosmetics, we will dedicate the following 2 days.

### User Stories

```
As a user who has loads of space
So that I can share space
I want to be able to sign up as a new user

As a user who has loads of space
So that I can share some space
I want to be able to upload a space

As a user who has loads of space
So I can list multiple spaces
I want to be able to upload multiple spaces

As a user
In order to have many clients book my space
I would like to show the range of dates where my space is available

As a user
So I don't overbook
I want to know if a place is already booked

As a user
To book a space
I want to be able to log in

As a user
To rent a space
I want to be able to book a space

```

### Class Modelling

We decided to focus on a `space` and `user` class. However, we opted to add an additional class called `mbnb` for `space` storage, so to speak.

### User Diagram

![User Diagram](https://raw.githubusercontent.com/frank-mck/MakerBnB/main/img/User.png)

### Space Diagram

![Space Diagram](https://raw.githubusercontent.com/frank-mck/MakerBnB/main/img/Space.png)

### Sequence Diagram

![Sequence Diagram](https://raw.githubusercontent.com/frank-mck/MakerBnB/main/img/Sequence.png)

### Testing

Run `rspec` for all testing within the directoy.

### Data Base

We created 2 DBs for this project: `makersbnb` & `makersbnb_test`.

Afterwards, we added two tables: `space` & `guest` for each DB. The specific commands can be found in the DB folder within this directory.
