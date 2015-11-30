# == Schema Information
#
# Table name: tasks
#
#  id               :integer          not null, primary key
#  name             :string
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  description      :text
#  completed        :boolean
#  days_to_complete :integer          default(1)
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
