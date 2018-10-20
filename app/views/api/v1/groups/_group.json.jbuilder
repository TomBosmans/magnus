json.id group.id
json.name group.name
json.description group.description

if show_items
  json.items group.items do |item|
    json.id item.id
    json.name item.name
    json.type item.class.to_s
  end
end
