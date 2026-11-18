# Roadmap

Implementation checklist. Mark an item complete when its code or configuration
is present; a checked item does not mean production deployment has been tested.
The application is currently an early Rails scaffold: `/up` is available, but
the root page and the planned product features are not implemented yet.

## Step 1 — Home page

- [ ] Create `WelcomeController#index`
- [ ] Set `root "welcome#index"` (keep `/up`)
- [ ] Minimal welcome view
- [ ] App title in the layout (PhotoApp)

## Step 2 — Production ready

- [ ] Review and adjust `config/deploy.yml` (Kamal)
- [x] Configure SQLite for production with persistent storage
- [x] Keep secrets in encrypted credentials / environment variables (never commit the master key)

## Step 3 — Authentication and styling

- [ ] Add Devise
- [ ] `User` model with the confirmable module
- [ ] Devise views (registration, session, confirmation, password)
- [ ] `authenticate_user!` in `ApplicationController`
- [ ] Skip authentication on `WelcomeController#index`
- [ ] Navbar: Sign In (signed out); email, edit profile, and Logout (signed in)
- [ ] Logout with `button_to` DELETE (Turbo-compatible)
- [ ] Bootstrap 5 in the layout
- [ ] `bin/rails db:migrate`

## Step 4 — Sign-up email

- [x] `default_url_options` in development (`localhost:3000`)
- [ ] `default_url_options` in production (replace the `example.com` placeholder with the real domain)
- [ ] Development delivery (`letter_opener` or `:file`) so the confirmation link can be opened
- [ ] Production SMTP from credentials
- [ ] Verify the flow: sign up → email → confirm account

## Step 5 — Landing with plans

- [ ] Welcome jumbotron (unauthenticated users)
- [ ] Premium plan ($10) and Amaze plan ($20) with a sign-up button
- [ ] “Welcome” message with email when signed in
- [ ] Landing styles (background image, plan cards)

## Step 6 — Payment at sign-up

- [ ] Stripe gem and initializer (keys in credentials)
- [ ] `Payment` model and migration (email, Stripe id, `user_id`)
- [ ] `User has_one :payment`
- [ ] Registration form with charge (Checkout or Payment Element; never send card data to the server)
- [ ] `RegistrationsController`: create user + $10 charge; roll back if payment fails
- [ ] Devise route pointing at the custom registrations controller
- [ ] Stimulus (or hosted Checkout) for the payment flow

## Step 7 — Turbo + Stripe compatibility

- [ ] Payment JS initializes correctly with Turbo (Stimulus `connect`, or hosted Checkout)
- [ ] Forms and Logout still work with Turbo
- [x] Do not disable Turbo

## Step 8 — Image uploads

- [ ] Install Active Storage (`bin/rails active_storage:install`) and migrate
- [ ] Scaffold `Image` (`name`, `user`)
- [ ] `has_one_attached :picture` (no string filename column)
- [ ] `User has_many :images`
- [ ] Validate image content type and size &lt; 5 MB
- [ ] Display a resized variant (300×300)
- [ ] CRUD: assign `current_user`; index only that user’s images
- [ ] Images link in the navbar
- [ ] Local disk in development; S3 in production (`config/storage.yml`)

## Done

_(Optionally move completed items here.)_
