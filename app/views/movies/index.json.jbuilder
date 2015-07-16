json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :year, :image_file_name
end
