class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
