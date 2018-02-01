class AddNumbersToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :followers, :string
    add_column :users, :following, :string
    add_column :users, :repo_count, :string
  end
end
