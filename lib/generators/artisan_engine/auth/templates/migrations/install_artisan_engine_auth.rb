class InstallArtisanEngineAuth < ActiveRecord::Migration
  def self.up
    create_table :artisans do |t|
      t.string    :first_name,    :null => false
      t.string    :last_name,     :null => false
      
      t.database_authenticatable
      
      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
