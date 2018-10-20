json.key_format! camelize: :lower

json.array! contents do |content|
  json.partial! 'content', content: content, show_details: false
end
