class RemovePrivateFromChannels < ActiveRecord::Migration[7.0]
  def change
    remove_column :channels, :private, :boolean
  end
end
