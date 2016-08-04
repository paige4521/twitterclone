json.extract! tweet, :id, :note, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)