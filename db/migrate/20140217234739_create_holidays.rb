class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string        :name
      t.datetime      :date
      t.belongs_to    :user
    end
    add_index :holidays, :date, unique: true
  end
end
