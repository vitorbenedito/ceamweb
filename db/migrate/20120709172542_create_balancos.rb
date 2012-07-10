class CreateBalancos < ActiveRecord::Migration
  def change
    create_table :balancos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
