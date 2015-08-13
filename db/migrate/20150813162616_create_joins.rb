class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.references :team
      t.references :channel

      t.timestamps
    end
  end
end
