# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.delete_all

# Core classes
Course.create(course_name: 'Operating Systems Principles', description: '', course_number: '519', department: "COSC")
Course.create(course_name: 'Database Management Systems 1', description: '', course_number: '578', department: "COSC")
Course.create(course_name: 'Advanced Data Structures', description: '', course_number: '600', department: "COSC")
Course.create(course_name: 'Computer Networks', description: '', course_number: '650', department: "COSC")

# Elective classes
Course.create(course_name: 'Software Project Management', description: '', course_number: '609', department: "COSC")
Course.create(course_name: 'Software Engineering', description: '', course_number: '612', department: "COSC", prerequisite_course_number: '600')
Course.create(course_name: 'Advanced Web Development', description: '', course_number: '617', department: "COSC",prerequisite_course_number: '600')
Course.create(course_name: 'Computer Vision and Image Processing', description: '', course_number: '602', department: "COSC")

Course.create(course_name: 'Software Testing and Maintenance', description: '', course_number: '603', department: "COSC", prerequisite_course_number: '612')
Course.create(course_name: 'Applied Cryptology', description: '', course_number: '645', department: "COSC", prerequisite_course_number: '600')
Course.create(course_name: 'Data Mining', description: '', course_number: '757', department: "COSC", prerequisite_course_number: '578')
