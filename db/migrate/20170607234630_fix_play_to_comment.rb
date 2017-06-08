class FixPlayToComment < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :play_experience, :play
  end
end  
