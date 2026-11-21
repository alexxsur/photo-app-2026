# Post-Generation Steps

Use this checklist after generating or changing application files.

## Local setup

1. Install JavaScript dependencies, build CSS, and prepare the application:

   ```sh
   yarn install --frozen-lockfile
   yarn build:css
   bin/setup --skip-server
   ```

   Node.js and Yarn 1 are required for the Bootstrap CSS build. `bin/setup`
   installs Ruby dependencies but does not install JavaScript dependencies.

2. Start the app and confirm the Rails health check responds at
   <http://localhost:3000/up>:

   ```sh
   bin/dev
   ```

   The root path (`/`) already routes to `WelcomeController#index`, and `/up`
   remains the Rails health check. The welcome view is a minimal page; the
   planned landing page remains to be implemented. `bin/dev` watches and
   rebuilds the CSS.

## Configuration checks

- Keep `config/master.key` out of source control. Use encrypted Rails
  credentials for application secrets and environment variables for deployment
  secrets.
- Development mailer URLs use `localhost:3000`. Production mailer URLs still
  use the `example.com` placeholder, and SMTP delivery is not configured.
  Development email is configured to use MailCatcher on `127.0.0.1:1025`.
  Start it in a separate terminal with
  `bundle exec mailcatcher --foreground --ip 127.0.0.1`, then view captured
  messages at <http://127.0.0.1:1080>. Replace the production placeholder host
  and sender and configure a real SMTP provider before deployment.
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

The welcome controller test requests `root_path`; authentication tests cover
the public home page, sign-in access, and account settings.
