# MRDBID Public Database Install README

This SQL download is meant to help someone start a local MRDBID database without receiving private site data.

## What Is Included

- Reference and lookup data used by MRDBID.
- MBList data if you downloaded the "includes MBList" file.
- One sample mushroom, plus a small amount of related sample data, so mushroom pages are not empty.

## What Is Not Included

- Real users.
- Passwords or password hashes.
- Admin accounts.
- Trusted devices.
- Invitation tokens.
- Roles, permissions, and other security tables.
- Uploaded images and Active Storage records.
- The full mushroom/specimen database.

This is intentional. Do not publish a SQL file that contains a working public admin login.

## Before You Start

You need:

- The MRDBID Rails application code.
- Ruby and the gems installed with Bundler.
- MySQL available.
- A fresh empty database, or a database you are willing to replace.
- A copy of the downloaded `.sql` file.

Do not import this into an existing database unless you have a backup.

## Step 1: Create An Empty Database

Example:

```sh
mysql -u YOUR_MYSQL_USER -p -e "CREATE DATABASE mrdbid_production CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"
```

Use the database name from your MRDBID `config/database.yml` or production environment.

## Step 2: Import The SQL File

From the folder where the downloaded SQL file is located:

```sh
mysql -u YOUR_MYSQL_USER -p mrdbid_production < mrdbid_lookup_tables_YYYYMMDD_HHMMSS.sql
```

Replace `mrdbid_lookup_tables_YYYYMMDD_HHMMSS.sql` with the real file name.

If you downloaded the smaller no-MBList file, use that file name instead.

## Step 3: Create Your Own Admin User

From the MRDBID application folder, run this command. Replace the email address and password first.

```sh
RAILS_ENV=production \
ADMIN_EMAIL=admin@example.com ADMIN_PASSWORD='make-a-long-unique-admin-password' \
bin/rails mrdbid:setup_users
```

The password must be at least 12 characters. Do not use the example password.

## Step 4: Optional Regular User

To create both an admin user and a regular user at the same time:

```sh
RAILS_ENV=production \
ADMIN_EMAIL=admin@example.com ADMIN_PASSWORD='make-a-long-unique-admin-password' \
REGULAR_EMAIL=user@example.com REGULAR_PASSWORD='make-a-long-unique-user-password' \
bin/rails mrdbid:setup_users
```

The task creates the required permission rows automatically, then creates or updates the users you named.

## Step 5: Sign In

Start the Rails application normally, then sign in with the email and password you provided.

If the app requires email confirmation, the setup task marks these accounts as confirmed.

## Security Notes

- Change any password you shared with someone else.
- Use a unique admin password for every installation.
- Do not post your finished database if it contains real users or uploaded images.
- Do not add public admin credentials to the SQL file.
- If you later export your own database, remove `users`, `trusted_devices`, `invitation_tokens`, `roles`, `permissions`, and other security tables before sharing it.

## Troubleshooting

If import fails because the database already has tables, create a fresh database or restore from backup before trying again.

If `bin/rails mrdbid:setup_users` fails because Rails cannot connect to MySQL, check `config/database.yml`, environment variables, database name, username, password, and host.

If user creation fails because of a missing two-factor encryption key, set `OTP_SECRET_ENCRYPTION_KEY` in the Rails environment and run the setup task again.

If you only want a public browsing database, you still need at least one admin account to manage the site.
