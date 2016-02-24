class CreateJoinTableActionBenefit < ActiveRecord::Migration
  def change
    create_join_table :actions, :benefits do |t|
      # t.index [:action_id, :benefit_id]
      # t.index [:benefit_id, :action_id]
    end
  end
end
