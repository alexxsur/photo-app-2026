# Command Reference

This is a reference for common development and maintenance commands, not a
chronological log of commands already run.

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
