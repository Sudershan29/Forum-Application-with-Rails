json.extract! post, :id, :title, :content, :likes, :dislikes, :updatedat, :userid, :created_at, :updated_at
json.url post_url(post, format: :json)
