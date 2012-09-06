class AddIdEntidadeToLocalizacao < ActiveRecord::Migration
  def change
    add_column :localizacaos, :idEntidade, :integer
  end
end
