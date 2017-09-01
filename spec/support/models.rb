class Mood < ActiveRecord::Base
  has_many :users
end
class User < ActiveRecord::Base
  has_many :pets
  has_many :user_roles
  has_many :roles, through: :user_roles
  belongs_to :mood
end

class Pet < ActiveRecord::Base
  belongs_to :user
end

class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, through: :user_roles
end

class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
