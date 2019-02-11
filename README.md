# Tribal

Tribal is a social fitness application.

## How to download the application

* In your terminal, type:

```
git clone https://github.com/CraftAcademy/tribal.git
```

* Run bundle

```
bundle install
```

* Run yarn install

```
yarn install
```

* Migrate the database

```
rails db:migrate
```

* To open the project, use this command in the terminal:

```
foreman start -f Procfile.dev
```
* To run tests:

```
rake
```

## How to use the application as a trainee

1. Click on "Register" and choose "Trainee" at the page that pops up before you go to the registration form.
2. You will now be on the home page where you will see all the sessions.
3. Now you can book a session by clicking "Book" to the right of the session.
4. You now have to pay for the session that you booked.
5. Join the video call when your session starts 
6. Get fit and have fun! 

## How to use the application as a coach

1. Click on "Register" and choose "Coach" at the page that pops up before you go to the login form.
2. You can now create a session by clicking "Add Session" on the home page.
3. Fill in the form with details about the session you want to create.
4. Click "Add Session".
5. You can now see your session on the home page!
6. Start the session by clicking "Start" to the right of the session.

## Tech Stack & APIs

* [Ruby on Rails](https://rubyonrails.org/) for backend
* [React](https://reactjs.org/) for views  
* We used r[eact-on-rails gem](https://github.com/shakacode/react_on_rails) for integrated monolith application development.
* [Rspec](http://rspec.info/) for unit testing
* [Cucumber](https://cucumber.io/) for acceptance testing
* [TailWindCSS](https://tailwindcss.com/docs/what-is-tailwind/) for bespoke views as requested by client
* [Pivotal Tracker](https://www.pivotaltracker.com) for project management
* [SemaphoreCI](https://semaphoreci.com/) for Continuous Integration
* [Heroku](https://heroku.com/) for deployment
* [Stripe](https://stripe.com) to handle payments
* [Agora](https://www.agora.io/en/) for handling video calls 
* [Facebook](https://facebook.com) for OAuth
* [GitHub](https://github.com/kianaditya) for version control and as central repository of code
* [Coveralls](https://coveralls.io/) for measuring test coverage
* [Codacy](https://www.codacy.com/) for automated code quality reviews

## Features included:
* Visitors can view sessions
* Visitors can register on the site - either using email, or with Facebook Oauth
* User can log in and log out
* Coach can create sessions
* Trainee / trainees can join a session in a videocall
* Responsive design - with a 'mobile-first' approach

## Contributors
(In Alphabetical order)
* [Aditya](https://github.com/kianaditya)
* [Greg](https://github.com/GergKllai1)
* [Hanna](https://github.com/HannaSwDn)
* [Johanna](https://github.com/johannaanden)
* [William](https://github.com/schneiderman805)

