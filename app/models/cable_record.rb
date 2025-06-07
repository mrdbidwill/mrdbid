# Base class for models that connect to the cable database
class CableRecord < ActiveRecord::Base
  connects_to database: { writing: :cable }
  abstract_class
end
