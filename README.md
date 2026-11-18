# PhotoApp 2026

PhotoApp is a Rails application scaffold for a photo-sharing service. The current
codebase is still an early scaffold: the root page, user accounts, payments, and
photo management described in the roadmap have not been implemented.

## Requirements

- Ruby 3.3.13 (see `.ruby-version`)
- Bundler
- SQLite

Install the Ruby dependencies and prepare the development database:

```sh
bin/setup --skip-server
```

Start the development server:

```sh
bin/dev
```

The health-check endpoint is available at <http://localhost:3000/up>. A home
page has not been configured yet, so `/` is not an application landing page.

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
placeholder host `example.com`; Active Storage is configured for local disk,
not S3.

## Documentation

- [Command reference](docs/COMMAND_HISTORY.md)
- [Post-generation checks](docs/POST_GENERATION_STEPS.md)
- [Roadmap](docs/ROADMAP.md)
