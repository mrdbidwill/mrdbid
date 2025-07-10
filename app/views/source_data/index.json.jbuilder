# frozen_string_literal: true

json.array! @source_data, partial: 'source_data/source_datum', as: :source_datum
