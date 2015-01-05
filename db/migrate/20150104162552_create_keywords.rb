class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string         :name
      t.string         :type
      t.integer        :material_id
      t.timestamps
    end
  end
end
