class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.column "name" , :string
      t.column "driver_id" , :integer
      t.column "license_number" , :string
      t.timestamps
    end
  end
end
