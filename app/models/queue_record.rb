# Base class for models that connect to the queue database
class QueueRecord < ActiveRecord::Base
  connects_to database: { writing: :queue }
  abstract_class
end
