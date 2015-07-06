json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :image, :year
end
