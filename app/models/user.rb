# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  has_many :tasks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
    role == 'admin'
  end

  def supervisor?
    role == 'supervisor'
  end

  def todays_tasks
    tasks.select{|t| t.time_left < 24 && t.time_left > 0}
  end

  def todays_progress_in_percent
    todays_completed_tasks = tasks.where(completed: true).select{ |t| t.time_left < 24 && t.time_left > 0 }
    ((todays_completed_tasks.count.to_f / todays_tasks.count.to_f) * 100.0)
  end

  def total_tasks_count
    tasks.count
  end

  def total_progress_in_percent
    ((tasks.where(completed: true).count.to_f / tasks.count) * 100)
  end
end
