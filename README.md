# MRDBID - Mushroom Database Identification

A comprehensive Rails application for mushroom identification, cataloging, and research. This system provides detailed character tracking, image management, and taxonomic organization for mycological research.

Thanks, AI, for all the hard work! But this is stall a work in progress, and there is much left for humans to do.
## Live Demo

Visit [https://mrdbid.com](https://mrdbid.com) to see the application in action.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Running Tests](#running-tests)
- [Deployment](#deployment)
- [Contributing](#contributing)

## Prerequisites

Before you begin, ensure you have the following installed:

- **Ruby**: 3.4.3 or higher
- **Rails**: 8.0.2 or higher
- **MySQL**: 5.6.4 or higher (or MariaDB equivalent)
- **Node.js**: For JavaScript runtime (Rails 8 requirements)
- **Bundler**: For gem management
- **ImageMagick** or **libvips**: For image processing

### System Dependencies

#### macOS
```bash
brew install mysql imagemagick libvips exiftool
```

#### Ubuntu/Debian
```bash
sudo apt-get install mysql-server libmysqlclient-dev imagemagick libvips-tools libimage-exiftool-perl
```

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mrdbidwill/mrdbid.git
   cd mrdbid
   ```

2. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies**
   ```bash
   bin/rails importmap:install
   ```

## Database Setup

### Option 1: Start with Empty Database (Quick Start)

If you want to set up a minimal working installation:

1. **Configure database credentials**

   Copy the example environment file and edit with your MySQL credentials:
   ```bash
   cp .env.example .env
   ```

   Edit `.env` and set:
   ```
   MYSQL_USER=your_mysql_username
   MYSQL_PASSWORD=your_mysql_password
   DB_HOST=127.0.0.1
   ```

2. **Create and migrate database**
   ```bash
   bundle exec rails db:create
   bundle exec rails db:migrate
   ```

3. **Create initial admin user**
   ```bash
   bundle exec rails db:seed
   ```

   This creates a default admin user. Check `db/seeds.rb` for credentials or customize as needed.

### Option 2: Import Reference Data from mrdbid.com (Recommended)

For a fully functional installation with all lookup tables, taxonomic data, and mushroom characters:

1. **Complete Option 1 steps above first** (create empty database)

2. **Download reference data from mrdbid.com**

   Visit [https://mrdbid.com/admin](https://mrdbid.com/admin) (requires admin login) and choose one of three database export options:

   - **Option 1: Lookup Tables (includes MBList)** (~400MB)
     - Complete reference data including MBList taxonomy
     - Recommended for most installations
     - Includes all character definitions, lookup tables, and taxonomic data

   - **Option 2: Lookup Tables (excludes MBList)** (~20MB)
     - All lookup tables WITHOUT the large MBList taxonomy table
     - Smaller, faster download
     - Good if you don't need the complete taxonomic reference

   - **Option 3: MBList Database Only** (~380MB)
     - Only the MBList taxonomy reference table
     - Combine with Option 2 if needed

   **Note**: All exports exclude user data and security tables for privacy.

3. **Import the downloaded SQL file**
   ```bash
   mysql -u your_mysql_username -p mrdbid_development < /path/to/downloaded/mrdbid_lookup_tables_YYYYMMDD_HHMMSS.sql
   ```

4. **Verify the import**
   ```bash
   bundle exec rails console
   ```

   Then in the console:
   ```ruby
   # Check that data was imported
   LookupItem.count
   MrCharacter.count
   MbList.count  # If you imported MBList data
   ```

5. **Create your admin user** (if not already present)
   ```bash
   bundle exec rails db:seed
   ```

### Understanding the Database Structure

This application uses several key tables:

- **Lookup Tables**: `lookup_types`, `lookup_items` - Define character options
- **Character System**: `mr_characters`, `parts` - Mushroom identification characters
- **Taxonomy**: `mb_lists` - Species/genus taxonomy (from MBList database)
- **User Data**: `mushrooms`, `articles`, `clusters` - User-created content
- **Reference Data**: `colors`, `countries`, `states`, `trees`, `plants` - Supporting lookup data

## Configuration

### Environment Variables

Create a `.env` file in the root directory with the following variables:

```bash
# Database
MYSQL_USER=your_mysql_username
MYSQL_PASSWORD=your_mysql_password
DB_HOST=127.0.0.1

# Rails
RAILS_ENV=development
SECRET_KEY_BASE=your_secret_key_base

# Optional: File storage (for production)
# AWS_ACCESS_KEY_ID=your_aws_key
# AWS_SECRET_ACCESS_KEY=your_aws_secret
# AWS_REGION=us-east-1
# AWS_BUCKET=your_bucket_name
```

Generate a secret key base:
```bash
bundle exec rails secret
```

### Database Configuration

The database configuration is in `config/database.yml`. It's set up to use environment variables, so you typically don't need to edit this file directly.

## Running the Application

1. **Start the Rails server**
   ```bash
   bundle exec rails server
   ```

2. **Access the application**

   Open your browser and navigate to:
   ```
   http://localhost:3000
   ```

3. **Access the admin dashboard** (after creating admin user)
   ```
   http://localhost:3000/admin
   ```

## Running Tests

The application uses Minitest for testing.

**Run all tests:**
```bash
bundle exec rails test
```

**Run specific test file:**
```bash
bundle exec rails test test/controllers/admin/database_exports_controller_test.rb
```

**Run with coverage:**
```bash
COVERAGE=true bundle exec rails test
```

## Key Features

- **Mushroom Character Tracking**: Detailed morphological and microscopic character recording
- **Image Management**: Upload, organize, and annotate mushroom photographs
- **Taxonomic Integration**: Integration with MBList taxonomy database
- **Search & Compare**: Search mushrooms by characters and compare specimens
- **Export Tools**: PDF export of mushroom records for offline reference
- **Admin Tools**: Database backup/restore, data management, version tracking

## Project Structure

```
mrdbid/
├── app/
│   ├── controllers/     # Application controllers
│   ├── models/          # ActiveRecord models
│   ├── views/           # ERB templates
│   ├── policies/        # Authorization policies (Pundit)
│   └── jobs/            # Background jobs
├── config/              # Application configuration
├── db/
│   ├── migrate/         # Database migrations
│   └── seeds.rb         # Seed data
├── test/                # Test suite
└── public/              # Static assets
```

## Deployment

This application uses Capistrano for deployment. See `config/deploy.rb` for deployment configuration.

**Deploy to production:**
```bash
bundle exec cap production deploy
```

## Contributing

We welcome contributions from the community! Here are some ways you can help:

### Code Contributions

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Translation Contributions

Help make MRDBID accessible to users worldwide by contributing translations!

**Supported Languages:**
- English (en) ✅
- Spanish (es)
- French (fr)
- German (de)
- Portuguese (pt)
- Italian (it)
- Japanese (ja)
- Chinese Simplified (zh-CN)
- Russian (ru)

**How to contribute translations:**

1. **Read the translation guide**: See [docs/I18N.md](docs/I18N.md) for detailed instructions
2. **Choose a language**: Pick a language file from `config/locales/` (e.g., `es.yml` for Spanish)
3. **Translate**: Use `config/locales/en.yml` as reference and fill in the empty strings
4. **Submit**: Create a pull request with your translations

Example:
```yaml
# config/locales/es.yml
es:
  views:
    mr_characters:
      new:
        title: "Nuevo Carácter de Hongo"
```

Even partial translations are valuable! See [docs/I18N.md](docs/I18N.md) for complete guidelines.

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

For questions or issues:
- Open an issue on GitHub
- Visit [https://mrdbid.com](https://mrdbid.com)
- Contact: mrdbidwill@gmail.com

## Acknowledgments

- **MBList Database**: Taxonomic data provided by the MBList project
- **Contributors**: See GitHub contributors list
- Built with Ruby on Rails 8 and modern web technologies

---

**Note**: This is a research and educational tool. Always verify mushroom identifications with expert mycologists before consumption or critical decisions.
