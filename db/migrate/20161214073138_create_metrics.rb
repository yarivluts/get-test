class CreateMetrics < ActiveRecord::Migration[5.0]
  def up
    create_table :metrics do |t|
      t.column "metric_name" , :string
      t.column "value" , :integer
      t.column "lon" , :decimal, precision: 11, scale: 8
      t.column "lat" , :decimal, precision: 10, scale: 8
      t.column "driver_id" , :integer
      t.column "timestamp" , :integer
      t.timestamps
    end
  end

  def down
    drop_table :metrics
  end
end
