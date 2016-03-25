class Category < ActiveRecord::Base
	has_many :report_categoryships
    has_many :reports, through: :report_categoryships
end
