# Base class for models that connect to the cache database
class CacheRecord < ActiveRecord::Base
  connects_to database: { writing: :cache }
  abstract_class
end