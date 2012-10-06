# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120914195403) do

  create_table "balancos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "entidade_id"
  end

  create_table "entidades", :force => true do |t|
    t.integer  "idEntidadeVpsa"
    t.integer  "cnpjEmpresa"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "entidades", ["idEntidadeVpsa", "cnpjEmpresa"], :name => "index_entidades_on_idEntidadeVpsa_and_cnpjEmpresa", :unique => true

  create_table "localizacaos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "entidade_id"
  end

  create_table "produto_aferidos", :force => true do |t|
    t.integer  "idProduto"
    t.decimal  "qtdeAferida"
    t.integer  "balanco_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.decimal  "qtdeEstoque"
  end

  add_index "produto_aferidos", ["balanco_id"], :name => "index_produto_aferidos_on_balanco_id"

  create_table "produtos", :force => true do |t|
    t.integer  "idProduto"
    t.integer  "localizacao_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "produtos", ["localizacao_id"], :name => "index_produtos_on_localizacao_id"

end
