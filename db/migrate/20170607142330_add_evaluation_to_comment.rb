class AddEvaluationToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :play_experience, :integer
    add_column :comments, :price, :integer
    add_column :comments, :difficulty, :integer   
  end
end
