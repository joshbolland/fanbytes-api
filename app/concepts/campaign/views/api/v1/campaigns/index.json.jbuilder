json.array! @campaigns do |campaign|
  json.extract! campaign, :id, :title, :start_date, :budget, :brief
end
