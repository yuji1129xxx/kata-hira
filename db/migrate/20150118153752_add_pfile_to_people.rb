class AddPfileToPeople < ActiveRecord::Migration
  def change
    add_column :people, :pfile, :string
  end
end
