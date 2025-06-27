json.extract! article, :id, :title, :author, :ref, :item_code, :comment, :my_rating, :my_comment, :created_at, :updated_at
json.url article_url(article, format: :json)
