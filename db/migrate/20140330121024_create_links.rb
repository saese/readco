class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.integer :user_id
    	t.integer :subtopic_id
		t.string  :title
		t.string :url

      t.timestamps
    end
  end
end
