class GroupJbuilder < ApplicationJbuilder
  def self.index(resources, options = {})
    Jbuilder.new do |json|
      json.array! resources do |resource|
        build(json, resource)
      end
    end
  end

  def self.show(resource, options = {})
    Jbuilder.new do |json|
      build(json, resource, with_items: true)
    end
  end

  private

  def self.build(json, group, with_items: false)
    json.id group.id
    json.name group.name
    json.description group.description
    build_items(json, group) if with_items
  end

  def self.build_items(json, group)
    json.items group.items do |item|
      json.id item.id
      json.type item.class.to_s
      json.name item.name
    end
  end
end
