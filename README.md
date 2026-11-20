# PhotoApp 2026

PhotoApp is a Rails application scaffold for a photo-sharing service. It has a
public welcome page, Devise authentication with account confirmation, and
Bootstrap styling. Payments and photo management remain planned.

## Requirements

- Ruby 3.3.13 (see `.ruby-version`)
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
placeholder host `example.com`, and Devise's sender is also a placeholder.
Confirmation emails are not yet configured for local development. Active
Storage is configured for local disk, not S3.

## Documentation

- [Command history and reference](docs/COMMAND_HISTORY.md)
- [Post-generation checks](docs/POST_GENERATION_STEPS.md)
- [Roadmap](docs/ROADMAP.md)
