class CreatePopularities < ActiveRecord::Migration
  def change
    create_table :popularities do |t|
      t.references :region, index: true
      t.references :channel, index: true

      t.timestamps
    end
  end
end
