# Rails Developer Intern Interview Exercise: robertsteilberg

Note: The instructions given for this exercise have been relocated to `INSTRUCTIONS.md`.

## Features

GetGitHub is a simple Rails application that allows a user to authenticate with their GitHub credentials and then view their public GitHub profile information. The application persists a GitHub API `access_token` so that users need not authenticate repeatedly to see their information. Updated profile information is immediately reflected by the app.

Note: I decided to use REST rather than Octokit for creating new app authorizations so that any password-based authentication would be handled through GitHub.

## Usage

Upon clicking "Yes, please!", you will need to authorize the app to access the pubic profile information associated with your account. If you want to go back through the authentication flow, you will need to either revoke all user tokens in the app's GitHub settings or revoke your specific application token in your GitHub settings. To authenticate a different user, log out of GitHub and then navigate back to `users/authenticate`.

## Configure a local development server

Follow the steps below to get a local instance of GetGitHub up and running on your machine.

### Setting up your Ruby environment

First, you'll need to install Ruby 2.3.2. You can [rbenv](https://github.com/sstephenson/rbenv) to do this:

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
