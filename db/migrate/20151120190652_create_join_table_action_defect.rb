class CreateJoinTableActionDefect < ActiveRecord::Migration
  def change
    create_join_table :actions, :defects do |t|
      # t.index [:action_id, :defect_id]
      # t.index [:defect_id, :action_id]
    end
  end
end
