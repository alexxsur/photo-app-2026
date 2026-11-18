# Post-Generation Steps

Use this checklist after generating or changing application files.

## Local setup

1. Install dependencies and prepare the database:

   ```sh
   bin/setup --skip-server
   ```

2. Start the app and confirm the Rails health check responds at
   <http://localhost:3000/up>:

   ```sh
   bin/dev
   ```

   The root path (`/`) is not configured yet. Add the landing page and route
   before expecting the application home page to work.

## Configuration checks

- Keep `config/master.key` out of source control. Use encrypted Rails
  credentials for application secrets and environment variables for deployment
  secrets.
- Development mailer URLs use `localhost:3000`. Production mailer URLs still
  use the `example.com` placeholder, and SMTP delivery is not configured.
- Production uses SQLite in the persistent Kamal storage volume. Establish and
  test a backup and restore procedure before relying on production data.
- Active Storage currently uses local disk in both development and production.
  Configure and verify a production storage service such as S3 before
  introducing user uploads.
- `config/deploy.yml` contains placeholder server and registry settings. Do not
  deploy until these, the production domain, HTTPS, and required secrets are
  configured.

## Validation

Run the relevant checks for the change. To run the full configured local CI
sequence:

```sh
bin/ci
```

The GitHub workflow separately runs Rails tests, RuboCop, Brakeman,
Bundler Audit, and the Importmap audit. Review its results before merging.
