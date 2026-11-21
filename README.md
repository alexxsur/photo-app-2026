# PhotoApp 2026

PhotoApp is a Rails application scaffold for a photo-sharing service. It has a
public welcome page, Devise authentication with account confirmation, and
Bootstrap styling. Payments and photo management remain planned.

## Requirements

- Ruby 3.3.14 (see `.ruby-version`)
- Bundler
- SQLite
- Node.js and Yarn 1 (used to build Bootstrap CSS)

Install the JavaScript dependencies, build the CSS, and prepare the application:

```sh
yarn install --frozen-lockfile
yarn build:css
bin/setup --skip-server
```

Start the development server:

```sh
bin/dev
```

The welcome page is available at <http://localhost:3000/> and the health-check
endpoint at <http://localhost:3000/up>. `bin/dev` also watches the stylesheets
and rebuilds CSS when they change.

## Local email preview

Development email is sent only to a local MailCatcher instance; it is not
delivered to real inboxes. Start MailCatcher in one terminal:

```sh
bundle exec mailcatcher --foreground --ip 127.0.0.1
```

Then start the Rails app with `bin/dev` in another terminal. Register at
<http://localhost:3000/users/sign_up>, then open
<http://127.0.0.1:1080> to view the confirmation email and follow its link.
MailCatcher receives SMTP on `127.0.0.1:1025` and provides its inbox on port
`1080`. Confirmation email delivery in production still requires a real SMTP
provider and domain configuration.

## Database

Development and test use SQLite databases under `storage/`. Production is also
configured to use SQLite, with its database files stored in the persistent
`/rails/storage` volume configured by Kamal. Production database backups and
restore procedures still need to be established before deployment.

To prepare or migrate the database:

```sh
bin/rails db:prepare
bin/rails db:migrate
```

## Tests and checks

Run the Rails tests:

```sh
bin/rails db:test:prepare test
```

Run the local CI checks (Ruby lint, dependency/security audits, and tests):

```sh
bin/ci
```

## Configuration and deployment

Rails encrypted credentials are edited with `bin/rails credentials:edit`.
Never commit `config/master.key` or put plaintext secrets in source control.

Deployment uses Kamal, but `config/deploy.yml` still contains example host and
registry settings. Configure the real servers, registry, domain, HTTPS, and
production mail delivery before deploying. Production mail currently uses the
placeholder host `example.com` and sender `no-reply@example.com`; set
`APP_HOST` and `MAILER_FROM` to production values. Active Storage is configured
for local disk, not S3.

## Documentation

- [Command history and reference](docs/COMMAND_HISTORY.md)
- [Devise views and customization](docs/COMMAND_HISTORY.md#devise-views)
- [Post-generation checks](docs/POST_GENERATION_STEPS.md)
- [Roadmap](docs/ROADMAP.md)
