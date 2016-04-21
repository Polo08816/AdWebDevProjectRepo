json.array!(@courses) do |course|
  json.extract! course, :id, :courseName, :description
  json.url course_url(course, format: :json)
end
