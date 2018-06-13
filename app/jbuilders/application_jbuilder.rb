class ApplicationJbuilder
  def self.index(resources, options = {})
    Jbuilder.new do |json|
      json.array! resources do |resource|
        build(json, resource)
      end
    end
  end

  def self.show(resource, options = {})
    Jbuilder.new do |json|
      build(json, resource)
    end
  end

  private

  def self.build(json, resource)
    json.id resource.id
  end
end
