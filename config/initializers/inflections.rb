# frozen_string_literal: true

# config/initializers/inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.singular 'lenses', 'lens' # Tell Rails explicitly that the singular of "lenses" is "lens"
end

