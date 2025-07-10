# frozen_string_literal: true

json.extract! mr_character, :id, :name, :display_option_id, :part_id, :source_data_id, :created_at, :updated_at
json.url mr_character_url(mr_character, format: :json)
