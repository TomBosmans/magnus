json.id content.id
json.type content.type
json.name content.name

if show_details
  content.fields.each do |(key, value)|
    json.set! key, value
  end
end

json.created_at content.created_at
json.updated_at content.updated_at
