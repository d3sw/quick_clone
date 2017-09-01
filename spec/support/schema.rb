ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :name
    t.string :alias
    t.references :mood
  end

  create_table :moods, force: true do |t|
    t.string :name
  end

  create_table :pets, force: true do |t|
    t.string :name
    t.references :user
  end

  create_table :roles, force: true do |t|
    t.string :name
  end

  create_table :user_roles, force: true do |t|
    t.references :user
    t.references :role
  end
end
