class AddIdEntidadeToBalanco < ActiveRecord::Migration
  def change
    add_column :balancos, :entidade_id, :integer ,:references=>"entidades"
  end
end
