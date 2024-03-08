json.extract! article, :id, :title, :description, :publish_date, :link, :author, :read_status, :created_at, :updated_at
json.url article_url(article, format: :json)
