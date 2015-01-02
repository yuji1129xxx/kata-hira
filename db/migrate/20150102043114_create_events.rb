class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string         :name
      t.text           :detail
      t.integer        :user_id
      t.integer        :person_id
      t.integer        :resource_id
      t.timestamps
    end
  end
end
