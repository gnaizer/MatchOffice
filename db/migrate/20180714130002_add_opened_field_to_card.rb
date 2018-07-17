class AddOpenedFieldToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :opened, :boolean, default: false
  end
end
