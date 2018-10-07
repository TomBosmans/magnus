class ApplicationPresenter < SimpleDelegator
  def self.wrap(collection)
    collection.map { |object| new object }
  end
end
