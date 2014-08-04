class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
    	t.string :title
    	t.text :body
    	t.string :seeking
    	t.timestamps
    end
  end
end
