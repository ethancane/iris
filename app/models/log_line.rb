# == Schema Information
#
# Table name: log_lines
#
#  id                :integer          not null, primary key
#  heroku_request_id :string
#  data              :text
#  logged_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class LogLine < ActiveRecord::Base
  serialize :data

  validates :heroku_request_id, presence: true
  validates :logged_at, presence: true
  validates :data, presence: true
end
