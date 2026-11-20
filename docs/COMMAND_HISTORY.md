# Command History and Reference

## Project setup commands

The commands in this section were reported as used to create and configure the
project. They are listed once, not as a chronological log, and their results
have not been verified. Generators are recorded for history and should not be
rerun as routine setup.

| Command | Purpose |
| --- | --- |
| `rbenv global 3.3.13` | Sets the global Ruby version for the environment. The project also records this version in `.ruby-version`. |
| `rbenv global` | Displays the global Ruby version. |
| `rbenv version` | Displays the active Ruby version and where it was selected. |
| `ruby -v` | Displays the Ruby interpreter version. |
| `rails new photo-app-2026` | Creates the Rails application. |
| `bundle install` | Installs the Ruby dependencies from the Gemfile. |
| `rails generate controller welcome index` | Generates the welcome controller, view, and test; the root route is configured separately. |
| `bin/rails generate devise:install` | Generates Devise's initial configuration. |
| `bin/rails generate devise User --confirmable` | Generates the Devise user model and migration; confirmation columns are provided by a separate migration in this project. |
| `bin/rails generate devise:views` | Generates Devise views for customization. |
| `bin/rails css:install:bootstrap` | Sets up Bootstrap through cssbundling-rails. |
| `rubocop` | Runs RuboCop to check Ruby code style. |
| `rubocop -a` | Runs RuboCop and automatically corrects offenses it can fix. |
| `bundle exec rubocop -a` | Runs RuboCop within the bundle and automatically corrects offenses it can fix; review the resulting changes. |

Both `rubocop -a` and `bundle exec rubocop -a` apply automatic corrections;
review the resulting changes. `bundle exec` runs the RuboCop version resolved
by this project's Gemfile and lockfile. Without it, the shell runs the
`rubocop` executable found in `PATH`, which may be a globally installed version
or another version selected by the current environment.

The commands below are a reference for common development and maintenance
tasks. They are grouped by purpose and are not all required on every run.

## Setup and development

| Command | Purpose |
| --- | --- |
| `yarn install --frozen-lockfile` | Installs JavaScript dependencies without changing the lockfile. |
| `yarn build:css` | Compiles and prefixes the application's CSS. |
| `bin/setup --skip-server` | Installs Ruby dependencies and prepares the database without starting the server; it does not install JavaScript dependencies. |

## Database and tests

| Command | Purpose |
| --- | --- |
| `bin/rails db:prepare` | Creates and prepares the database if needed and applies pending migrations. |
| `rails db:migrate` | Applies pending database migrations. |
| `bin/rails db:migrate` | Applies pending database migrations using the project's Rails executable. |
| `bin/rails db:migrate:status` | Displays the status of database migrations. |
| `bin/rails test test/controllers/welcome_controller_test.rb test/integration/authentication_test.rb test/models/user_test.rb` | Runs the specified welcome, authentication, and user tests. |
| `bin/rails test` | Runs the Rails test suite. |
| `bin/rails db:test:prepare test` | Prepares the test database and runs the Rails tests. |

## Quality and security checks

| Command | Purpose |
| --- | --- |
| `bin/rails zeitwerk:check` | Checks whether application code can be eager-loaded by Zeitwerk. |
| `bundle show cssbundling-rails` | Displays the installed gem's location. |
| `bin/rubocop` | Checks Ruby code style. |
| `bin/brakeman --no-pager` | Runs static security analysis on the Rails application. |
| `bin/bundler-audit` | Checks Ruby dependencies for known vulnerabilities. |
| `bin/importmap audit` | Checks importmap JavaScript dependencies for known vulnerabilities. |
| `bin/ci` | Runs the configured local setup, lint, security, and test checks. |

## Start the application

| Command | Purpose |
| --- | --- |
| `bin/dev` | Starts the development server and CSS watcher. |

## Deployment

Use Kamal only after replacing the example server and registry settings in
`config/deploy.yml` and configuring production secrets:

| Command | Purpose |
| --- | --- |
| `bin/kamal setup` | Performs the initial Kamal setup and deployment. |
| `bin/kamal deploy` | Builds and deploys a new application version with Kamal. |
