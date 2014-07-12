class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards_tables do |t|
    	t.string :title
    	t.string :content
    	t.string :category
    	t.timestamps
    end
  end
end
