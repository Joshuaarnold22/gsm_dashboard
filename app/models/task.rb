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

class Task < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  def completed_count
    self.completed.count
  end

  def time_left
    # if self.time == nil
    # created_at.to_i
      estimate = days_to_complete * 24 + (created_at.to_f - DateTime.now.to_f) / 60 / 60
      estimate.round(1)
      # 24 - ((DateTime.now.to_time - created_at.to_time).to_i).abs
    # else
      # (self.time * 24) - (DateTime.now.to_time - created_at.to_time).to_i
      #(self.time * 24).to_i - (DateTime.now.strftime("%H").to_i)
    # end
  end
end
