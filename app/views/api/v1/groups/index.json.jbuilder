json.key_format! camelize: :lower

json.array! groups do |group|
  json.partial! 'group', group: group, show_items: false
end
