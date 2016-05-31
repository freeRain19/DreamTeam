json.array!(@teams) do |task|
  json.extract! task, :id, :title, :status, :start_date, :due_date, :estimation
  json.url task_url(task, format: :json)
end
