# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!( :name => "一般事故" )
Category.create!( :name => "重大事故" )
Category.create!( :name => "交警支援" )
Category.create!( :name => "消防單位支援" )
Category.create!( :name => "救護車支援" )