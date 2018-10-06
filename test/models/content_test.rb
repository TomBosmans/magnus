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

class ContentTest < ActiveSupport::TestCase
  test_respond_to Content, [:types]
  test_respond_to Content.new, [:name, :type, :fields, :options, :group]

  # Keep expected classes up to date.
  # This test might be removed in the future.
  test 'types returns expected classes' do
    expected_classes = [
      Article
    ]

    assert_equal Content.types, expected_classes
  end

  test 'can have a group' do
    content = create(:content)
    content.group = create(:group)
    assert content.group.present?
  end
end
