json.array! @boardgames do |boardgame|
  json.id boardgame.id
  json.name boardgame.name
  json.developer boardgame.developer
  json.categories do
    json.array! boardgame.categories.each do |category|
      json.mechanism category.mechanism
    end
  end
end