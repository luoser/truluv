class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards_tables do |t|
    	t.title :string
    	t.content :string
    	t.timestamps
    end
  end
end
