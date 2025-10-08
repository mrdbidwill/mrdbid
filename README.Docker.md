# Docker Setup for MRDBID

## Prerequisites

1. Docker and Docker Compose installed
2. Required environment variables (see `.env.example`)

## Initial Setup

### 1. Create Environment File

Copy `.env.example` to `.env` and fill in the required values:

```bash
cp .env.example .env
```

**Required Environment Variables:**

- `RAILS_MASTER_KEY`: Get from `config/master.key` file
- `OTP_SECRET_ENCRYPTION_KEY`: Generate with `rails secret` or use existing value
- `APP_HOST`: Set to your domain (e.g., `mrbid.com`) or `localhost:3000` for dev

### 2. Build and Start Containers

```bash
docker-compose build
docker-compose up -d
```

### 3. Setup Database

```bash
# Run migrations
docker-compose exec web rails db:migrate

# Seed initial data (creates permissions table)
docker-compose exec web rails db:seed

# Load your SQL scripts
docker-compose exec -T db mysql -u mrdbid_user -puR\!TxC4avEWp mrdbid_development < db/scripts/your_script.sql
```

## Common Commands

### Access Rails Console
```bash
docker-compose exec web rails console
```

### Access MySQL CLI
```bash
docker-compose exec db mysql -u mrdbid_user -puR\!TxC4avEWp mrdbid_development
```

### View Logs
```bash
docker-compose logs -f web    # Rails logs
docker-compose logs -f db     # MySQL logs
```

### Run Tests
```bash
docker-compose exec web rails test
```

### Stop Containers
```bash
docker-compose down           # Stop and remove containers
docker-compose down -v        # Also remove volumes (WARNING: deletes database!)
```

### Rebuild After Code Changes
```bash
docker-compose down
docker-compose build
docker-compose up -d
```

## Database Management

### Backup Database
```bash
docker-compose exec db mysqldump -u mrdbid_user -puR\!TxC4avEWp mrdbid_development > backup.sql
```

### Restore Database
```bash
docker-compose exec -T db mysql -u mrdbid_user -puR\!TxC4avEWp mrdbid_development < backup.sql
```

### Load Multiple SQL Scripts
```bash
for script in db/scripts/*.sql; do
  docker-compose exec -T db mysql -u mrdbid_user -puR\!TxC4avEWp mrdbid_development < "$script"
done
```

## Production Deployment

For production deployment, see `docker-compose.prod.yml` and update:

1. Set `RAILS_ENV=production`
2. Use production database credentials
3. Set proper `APP_HOST` domain
4. Enable SSL/TLS
5. Configure production SMTP settings in Rails credentials

## Troubleshooting

### Database Connection Errors
- Ensure database container is fully started: `docker-compose logs db | grep "ready for connections"`
- Wait 10-15 seconds after `docker-compose up` for MySQL initialization

### Permission Errors on User Registration
- Run `docker-compose exec web rails db:seed` to create permission records

### Missing MySQL Client
- Rebuild web container: `docker-compose build web`

### Port Already in Use
- Stop local MySQL: `sudo service mysql stop` (Linux) or `brew services stop mysql` (Mac)
- Change port in `docker-compose.yml`: `"3307:3306"` instead of `"3306:3306"`

## Moving Between Computers

1. Commit your code to git (Docker files are included)
2. On new computer, clone repo
3. Create `.env` file with proper keys
4. Run setup commands above
5. Load your database backup or SQL scripts

No need to install Ruby, MySQL, or other dependencies locally!
