json.array!(@courses) do |course|
  json.extract! course, :id, :Course, :description
  json.url course_url(course, format: :json)
end
