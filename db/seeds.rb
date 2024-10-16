# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

def self.reset_pk_sequence(table_name)
  case ActiveRecord::Base.connection.adapter_name
    when 'SQlite'
      ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='#{table_name}'")
  end
end

  User.delete_all
  reset_pk_sequence("users")

  CSV.foreach("db/users.csv", headers: true) do |row|
    User.create(
      user_name: row["user_name"],password_digest: row["password_digest"], name: row["name"], grade: row["grade"], klass: row["klass"], profile: row["profile"], hobby_1: row["hobby_1"], hobby_2: row["hobby_2"], hobby_3: row["hobby_3"], hobby_4: row["hobby_4"], hobby_5: row["hobby_5"]
    )
  end