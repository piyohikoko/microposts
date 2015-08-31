class AddSelfintroductionToUser < ActiveRecord::Migration
  def change
    add_column :users, :selfintroduction, :string
  end
end
