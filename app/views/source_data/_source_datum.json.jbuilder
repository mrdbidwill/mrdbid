# frozen_string_literal: true

json.extract! source_datum, :id, :title, :author, :ref, :item_code, :source_data_type, :comment, :created_at,
              :updated_at
json.url source_datum_url(source_datum, format: :json)
