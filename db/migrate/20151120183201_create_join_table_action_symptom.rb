class CreateJoinTableActionSymptom < ActiveRecord::Migration
  def change
    create_join_table :actions, :symptoms do |t|
      # t.index [:action_id, :symptom_id]
      # t.index [:symptom_id, :action_id]
    end
  end
end
