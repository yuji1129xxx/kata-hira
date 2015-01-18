class AddPfileToResources < ActiveRecord::Migration
  def change
    add_column :resources, :pfile, :string
  end
end
