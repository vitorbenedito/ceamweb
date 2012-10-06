class AddIdEntidadeToLocalizacao < ActiveRecord::Migration
  def change
    add_column :localizacaos, :entidade_id, :integer ,:references=>"entidades"
  end
end
