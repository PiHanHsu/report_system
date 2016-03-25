class Report < ActiveRecord::Base
   has_many :report_categoryships
   has_many :categories, through: :report_categoryships 
   has_many :comments
   
   belongs_to :user 

end
