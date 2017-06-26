class AddEmailToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_email, :string 
  end
end
