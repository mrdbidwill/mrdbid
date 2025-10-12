# Deployment Instructions

## One-Time Server Setup

### 1. Copy Production Credentials Key

The production database credentials are stored in Rails encrypted credentials. Copy the key file to the server:

```bash
# From your local machine:
scp config/credentials/production.key root@srv628878:/opt/mrdbid/config/credentials/production.key

# On the server, set proper permissions:
chmod 600 /opt/mrdbid/config/credentials/production.key
```

### 2. Verify Credentials Work

Test that Rails can read the credentials:

```bash
# On the server:
cd /opt/mrdbid
RAILS_ENV=production bundle exec rails credentials:show --environment production
```

You should see the database credentials listed.

## How It Works

- **Development/Test**: Uses `.env` file (not committed to git) with `MYSQL_USER`, `MYSQL_PASSWORD`, `DB_HOST`
- **Production**: Uses Rails encrypted credentials (`config/credentials/production.yml.enc`) which requires the key file (`config/credentials/production.key`)

The `config/database.yml` automatically:
1. First checks `Rails.application.credentials.dig(:database, :username)` (production)
2. Falls back to `ENV['MYSQL_USER']` (development)

## Running Scripts on the Server

Once the production.key is in place, all Rails commands work:

```bash
cd /opt/mrdbid
RAILS_ENV=production bundle exec rails runner db/scripts/mblist/load_mblists.rb --truncate db/scripts/mblist/sanitize_mblist_csv.rb
```

## Security Notes

- ✅ `.env` is in `.gitignore` (local development secrets)
- ✅ `config/credentials/*.key` is in `.gitignore` (production secrets)
- ✅ `config/credentials/production.yml.enc` is encrypted and safe to commit
- ✅ Never commit passwords or keys to git

## Updating Production Credentials

To add/change production credentials:

```bash
# On your local machine:
EDITOR=nano bin/rails credentials:edit --environment production

# Then deploy the updated .yml.enc file (the key doesn't change)
git add config/credentials/production.yml.enc
git commit -m "Update production credentials"
git push
```
