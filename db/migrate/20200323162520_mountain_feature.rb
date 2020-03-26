class MountainFeature < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains
    add_column :mountains, :mount_title, :string
  end
end
