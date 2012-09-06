class AddIdEntidadeToBalanco < ActiveRecord::Migration
  def change
    add_column :balancos, :idEntidade, :integer
  end
end
