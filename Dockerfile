# Use the official Ruby image with version matching your .ruby-version (e.g., 3.4.3)
FROM ruby:3.4.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libvips \
  libvips-dev \
  libmariadb-dev-compat \
  libmariadb-dev \
  default-mysql-client \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install bundler for your app (ensure right version if needed)
RUN gem install bundler:2.6.9

# Copy Gemfiles first for caching
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the main app source (excluding things in .dockerignore)
COPY . .

# Install JS dependencies
RUN if [ -f package.json ]; then npm install; fi

# Precompile assets if necessary (optional for dev)
# RUN bundle exec rails assets:precompile

# Expose port 3000 for Rails server
EXPOSE 3000

# Set default
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
