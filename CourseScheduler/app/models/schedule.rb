class Schedule < ActiveRecord::Base
  belongs_to :users, :foreign_key => 'users_id'
  belongs_to :courses, :foreign_key => 'courses_id'
end