class CreatePreparationPeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :preparation_periods do |t|
      t.string :preparation_period
      t.timestamps
    end
  end
end
