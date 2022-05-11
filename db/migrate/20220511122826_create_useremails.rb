class CreateUseremails < ActiveRecord::Migration[6.1]
  def change
    create_table :useremails do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :order_id

      t.timestamps
    end
  end
end
