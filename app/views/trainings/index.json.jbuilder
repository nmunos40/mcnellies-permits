json.array!(@trainings) do |training|
  json.extract! training, :id, :course_name
  json.url training_url(training, format: :json)
end
