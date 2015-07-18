
#Article is a class which inherits from ActiveRecord::Base
#ActiveRecord supplies functionality to your rils models
#for free including basic databse CRUD
class Article < ActiveRecord::Base
	validates :title, presence: true,
					length: { minimum: 5}

end
