class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :prerequisitecourses,  class_name: "Course"
