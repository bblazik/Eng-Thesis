class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.references :category, index: true
      t.timestamps null: false
    end
  end
end
