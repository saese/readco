class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
    	t.integer :user_id
    	t.integer :topic_id
		t.string  :title
		t.text :description

      t.timestamps
    end
  end
end
