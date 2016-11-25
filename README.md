# Rails Developer Intern Interview Exercise: robertsteilberg

Note: The given instructions for this exercise have been relocated to `INSTRUCTIONS.md`.

## Features

GetGitHub is a simple Rails application that allows a user to authenticate with their GitHub credentials and then view their public GitHub profile information. The application persists a GitHub API `access_token` so that users need not authenticate repeatedly to see their information. Updated profile information is immediately reflected by the app.

## Configure a local development server

Follow the steps below to get a local instance of GetGitHub up and running on your machine.

### Setting up your Ruby environment

First, you'll need to install Ruby 2.3.2. I recommend using [rbenv](https://github.com/sstephenson/rbenv).

```
rbenv install 2.3.2
```
Next, navigate to the `rails-developer-intern-robertsteilberg` directory and run:

```
rbenv local 2.3.2
```

### Configuring gems and environment variables

Next, install the bundler gem so that you can install gems from the `Gemfile`.

```bash
gem install bundler && rbenv rehash
```
Once bundler is installed, you can go ahead and run the `setup` script:
```
script/setup
```
The `setup` script will prompt you to enter your GitHub-registered application's `CLIENT_ID` and `CLIENT_SECRET`, which will be stored as environment variables for security. You can register your application [here](https://github.com/settings/applications/new). The Homepage URL should be `http://localhost:3000/` and the Authorization Callback URL should be `http://localhost:3000/callbacks/new` for your development server. After registering your application, you'll have access to the generated `CLIENT_ID` and `CLIENT_SECRET`.

### Next steps

The app can now be run with
```
rails s
```
and accessed at `http://localhost:3000/`.

### Automated tests

The RSpec automated tests can be run via `rake`.
