json.extract! conference_session, :id, :title, :description, :track, :conference_day, :created_at, :updated_at
json.url conference_session_url(conference_session, format: :json)
