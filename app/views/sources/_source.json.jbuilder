json.extract! source, :id, :title, :author, :ref, :item_code, :comment, :my_rating, :my_comment, :entered_by_id, :created_at, :updated_at
json.url source_url(source, format: :json)
