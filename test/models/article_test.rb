# == Schema Information
#
# Table name: contents
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  type       :string
#  fields     :jsonb            not null
#  options    :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

describe Article do
  instance_responds_to :description, :text

  it 'type is Article' do
    assert_equal Article.new.type, 'Article'
  end
end
