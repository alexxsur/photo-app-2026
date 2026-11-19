# Command History and Reference

## Project setup commands

The following commands were reported as used to create and configure the
project:

```sh
rails new photo-app-2026
rbenv global 3.3.13
rbenv global
rbenv version
ruby -v
bundle install
rails db:migrate
rails generate controller welcome index
```

`rbenv global 3.3.13` selects the global Ruby version for that environment;
`.ruby-version` also records `3.3.13` for this project. The controller
generator creates the welcome controller, view, and test. The root route is
configured separately in `config/routes.rb`.

The commands below are a reference for common development and maintenance
tasks, not a record that each has already been run.

## Setup and development

```sh
bin/setup --skip-server
bin/dev
```

`bin/setup` installs dependencies and prepares the database. Use `--skip-server`
to keep setup from starting the development server.

## Database and tests

```sh
bin/rails db:prepare
bin/rails db:migrate
bin/rails db:test:prepare test
```

## Quality and security checks

```sh
bin/rubocop
bin/brakeman --no-pager
bin/bundler-audit
bin/importmap audit
bin/ci
```

`bin/ci` runs the configured local checks, including lint, audits, and tests.

## Deployment

Use Kamal only after replacing the example server and registry settings in
`config/deploy.yml` and configuring production secrets:

```sh
bin/kamal setup
bin/kamal deploy
```
