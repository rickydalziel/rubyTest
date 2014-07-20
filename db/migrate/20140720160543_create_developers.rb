class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.date :formed

      t.timestamps
    end
  end
end
