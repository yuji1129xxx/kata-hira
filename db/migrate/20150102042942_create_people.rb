class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string         :name
      t.text           :detail
      t.timestamps
    end
  end
end
