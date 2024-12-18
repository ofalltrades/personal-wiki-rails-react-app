class AddJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    drop_table :jwt_denylists
    create_table :jwt_denylists do |t|
      t.text :jti, null: false
      t.datetime :exp, null: false
    end
    add_index :jwt_denylists, :jti
  end
end