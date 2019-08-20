# ChatApp API

A chat application API that uses ActionCable to open a TCP connection and push user messages through websockets in real time. 

## Setup & Installation

Clone the repository into a directory of your choosing.

```
git clone git@github.com:tylermarshal/rails-chatapp-api.git
```

Move into the directory & install the required gems.

```
cd rails-chatapp-api
```
```
bundle install
```

From here you will need to create the PostgreSQL database and tables:

```
rails db:create db:migrate
```

The application uses Devise JWT for authentication. You will need to generate a secret key:

```
rake secret
```

Create a `.env` file in the root directory of your application and place the following environment variable in this file:

```
DEVISE_JWT_SECRET_KEY=<your secret key here>
```

Start a rails server and visit http://localhost:3000/:

```
rails s
```

This is only an API and a connection will need to be established on the client-side.


## Testing

To run the test suite, you can execute the following in your terminal:

```
bundle exec rspec
```

## Creator
[Tyler Madsen](https://github.com/tylermarshal)

