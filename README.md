# Rails Multiple Databases Best Practices

## Understanding the Rails Guide Recommendation

The Rails guide on [Active Record Multiple Databases](https://guides.rubyonrails.org/active_record_multiple_databases.html) states:

> "It's important to connect to your database in a single model and then inherit from that model for the tables rather than connect multiple individual models to the same database. Database clients have a limit to the number of open connections there can be, and if you do this, it will multiply the number of connections you have since Rails uses the model class name for the connection specification name."

## What This Means for Model Creation

This recommendation **does not** change the fundamental Rails practice of creating a model for each database table. Instead, it's about how you structure your model inheritance when working with multiple databases.

### The Correct Approach

1. Create an abstract base class for each database connection
2. Have your models inherit from the appropriate base class
3. Each model still represents a single table

### Example Structure

For a Rails application with multiple databases:

```ruby
# Base class for the primary database
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

# Base class for a secondary database (e.g., analytics)
class AnalyticsRecord < ActiveRecord::Base
  connects_to database: { writing: :analytics }
  abstract_class
end

# Models for primary database tables
class User < ApplicationRecord
  # This model uses the primary database connection
end

class Product < ApplicationRecord
  # This model also uses the primary database connection
end

# Models for analytics database tables
class PageView < AnalyticsRecord
  # This model uses the analytics database connection
end

class UserActivity < AnalyticsRecord
  # This model also uses the analytics database connection
end
```

## Why This Matters

Each model class in Rails creates a connection pool to its database. If you directly connect multiple models to the same database using `connects_to`, you'll create multiple connection pools to the same database, which:

1. Wastes database connections (which are limited resources)
2. Can lead to connection pool exhaustion
3. Reduces application performance

By using abstract base classes, all models for a particular database share the same connection pool, which is more efficient.

## Application to This Project

This project's `config/database.yml` shows multiple databases in production:
- primary
- cache
- queue
- cable

Following the best practice, you should:

1. Keep `ApplicationRecord` as the base class for models using the primary database
2. Create additional abstract base classes for models that need to use the cache, queue, or cable databases

## Standard Rails Model Creation

You should still create a model for each table in your database. The recommendation only affects how you organize your model inheritance hierarchy when working with multiple databases.
