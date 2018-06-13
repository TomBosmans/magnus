class ContentJbuilder < ApplicationJbuilder
  def self.index(contents)
    Jbuilder.new do |json|
      json.array! contents do |content|
        build(json, content)
      end
    end
  end

  def self.show(content)
    Jbuilder.new do |json|
      build(json, content)
    end
  end

  private

  def self.build(json, content)
    json.id content.id
    json.name content.name

    content.fields.each do |key, value|
      json.set! key, value
    end
  end
end
