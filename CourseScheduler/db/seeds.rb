# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.delete_all

#Core classes
Course.create(courseName: 'Operating Systems Principles', description: '', courseNumber: '519')
Course.create(courseName: 'Database Management Systems 1', description: '', courseNumber: '578')
Course.create(courseName: 'Advanced Data Structures', description: '', courseNumber: '600')
Course.create(courseName: 'Computer Networks', description: '', courseNumber: '650')

#Elective classes
Course.create(courseName: 'Software Project Management', description: '', courseNumber: '609')
Course.create(courseName: 'Software Engineering', description: '', courseNumber: '612')
Course.create(courseName: 'Advanced Web Development', description: '', courseNumber: '617')
Course.create(courseName: 'Computer Vision and Image Processing', description: '', courseNumber: '602')