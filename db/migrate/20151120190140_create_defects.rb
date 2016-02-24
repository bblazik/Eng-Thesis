class CreateDefects < ActiveRecord::Migration
  def change
    create_table :defects do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
