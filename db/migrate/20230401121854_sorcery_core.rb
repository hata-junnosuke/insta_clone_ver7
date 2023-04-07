class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt

      # 検索する時に使われるカラムにはindexをつけると処理を高速化できる
      t.string :username, null: false, index: { unique: true }

      t.timestamps                null: false
    end
  end
end
