# PushTech Hotel Reservation Challenge 
## Description
This challenge is about the development of a web application in which we can create reservations for our hotel. This web application must have access via REST API (Json). 

The functions that must be carried out are: 
* Create reservation
* Edit reservation,
* Delete reservation
* List reservations.

## Environment
* Ruby 3.1.2
* Rails 7.0.3.1
* MySQL 8.0

## Gems
* actioncable (7.0.3.1)
* actionmailbox (7.0.3.1)
* actionmailer (7.0.3.1)
* actionpack (7.0.3.1)
* actiontext (7.0.3.1)
* actionview (7.0.3.1)
* activejob (7.0.3.1)
* activemodel (7.0.3.1)
* activerecord (7.0.3.1)
* activestorage (7.0.3.1)
* activesupport (7.0.3.1)
* addressable (2.8.0)
* autoprefixer-rails (10.4.7.0)
* bcrypt (3.1.18)
* bindex (0.8.1)
* bootsnap (1.13.0)
* bootstrap (5.2.0)
* builder (3.2.4)
* capybara (3.37.1)
* childprocess (4.1.0)
* concurrent-ruby (1.1.10)
* crass (1.0.6)
* digest (3.1.0)
* erubi (1.11.0)
* execjs (2.8.1)
* ffi (1.15.5)
* globalid (1.0.0)
* i18n (1.12.0)
* importmap-rails (1.1.5)
* jbuilder (2.11.5)
* loofah (2.18.0)
* mail (2.7.1)
* marcel (1.0.2)
* matrix (0.4.2)
* method_source (1.0.0)
* mini_mime (1.1.2)
* minitest (5.16.3)
* msgpack (1.5.4)
* mysql2 (0.5.4)
* net-imap (0.2.3)
* net-pop (0.1.1)
* net-protocol (0.1.3)
* net-smtp (0.3.1)
* nio4r (2.5.8)
* nokogiri (1.13.8)
* pagy (5.10.1)
* popper_js (2.11.5)
* public_suffix (4.0.7)
* puma (5.6.4)
* racc (1.6.0)
* rack (2.2.4)
* rack-test (2.0.2)
* rails (7.0.3.1)
* rails-dom-testing (2.0.3)
* rails-html-sanitizer (1.4.3)
* railties (7.0.3.1)
* rake (13.0.6)
* ransack (3.2.1)
* regexp_parser (2.5.0)
* rexml (3.2.5)
* rubyzip (2.3.2)
* sassc (2.4.0)
* sassc-rails (2.1.2)
* selenium-webdriver (4.4.0)
* sprockets (4.1.1)
* sprockets-rails (3.4.2)
* stimulus-rails (1.1.0)
* strscan (3.0.4)
* thor (1.2.1)
* tilt (2.0.11)
* timeout (0.3.0)
* turbo-rails (1.1.1)
* tzinfo (2.0.5)
* tzinfo-data (1.2022.3)
* web-console (4.2.0)
* webdrivers (5.0.0)
* websocket (1.2.9)
* websocket-driver (0.7.5)
* websocket-extensions (0.1.5)
* xpath (3.2.0)
* zeitwerk (2.6.0)

## Deployment
1. Clone the repo in your local machine:

```
> git clone https://github.com/AdrianTFG/pushtech-hotel-reservation-challenge.git
```

2. Install the gems

```
> bundle install
```

***NOTE: In this part you need to make sure that you have bundler installed in your rails***

3. Launch migrations

```
> rails db:create
> rails db:create RAILS_ENV=test
> rails db:migrate
> rails db:migrate RAILS_ENV=test
```

4. Set test data to play

```
> rails db:fixtures:load
> rails db:fixtures:load RAILS_ENV=test
```

## Launch the app

Simply launch the puma server by doing:

```
> rails s
```

Inside the login form, you can enter with whatever of our 3 users:

| Name | Password | Admin |
|:---:|---|---:|
| Adrian | 123456 | YES |
| Ben | 123456 | NO |
| Carlos | 123456 | NO |

***Adrian is the only user with admin privileges.***


## Launch tests

We just use the test integrates in rails, type in the terminal inside de project folder:

```
> rails test
```

## API Rest

I use postman to test this part, you can use whatever you want. The only think to keep in mind is the routes and the body to send if is necessary:

First of all you need to check your token. Go to the web application (or the database) and check the section "My Token" ("Ver mi Token" if you have seated spanish as your browser language).

# Reservations
- Listing all the reservation: [GET]***http://localhost:3000/api/v1/reservations***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN
  }
  ```
- Create a reservation: [POST]***http://localhost:3000/api/v1/reservations***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN,
      "room_id": "603788148",
      "entry_date": "2022-08-18 00:00:00.000000",
      "departure_date": "2022-08-26 00:00:00.000000",
      "customer_name": "Test Api Changed",
      "customer_email": "test@api.com"
  }
  ```
- Update a reservation: [PUT]***http://localhost:3000/api/v1/reservations/RESERVATION_ID***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN,
      "customer_name": "Updated Test Api Changed",
      "customer_email": "Updated test@api.com"
  }
  ```
- Update a reservation: [DELETE]***http://localhost:3000/api/v1/reservations/RESERVATION_ID***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN
  }
  ```

# Rooms
**NOTE: If you dont use the token of an admin user, you can't do nothing in this part.**
- Listing all the rooms: [GET]***http://localhost:3000/api/v1/rooms***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN
  }
  ```
 
- Create a room: [POST]***http://localhost:3000/api/v1/reservations***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN,
      "room_name": "Room Test",
      "description": "Rom Description Test",
      "price": 150,
      "currency": "EUR"
  }
  ```
- Update room: [PUT]***http://localhost:3000/api/v1/reservations/RESERVATION_ID***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN,
      "room_name": "Updated Room Test",
      "description": "Updated Rom Description Test"
  }
  ```
- Update a reservation: [DELETE]***http://localhost:3000/api/v1/reservations/RESERVATION_ID***
    * Set the body:
  ```json
  {
      "token": YOUR_TOKEN
  }
  ```  
  