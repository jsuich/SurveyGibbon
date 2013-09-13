class CreateTables < ActiveRecord::Migration

  def change
  	create_table :users do |t|
        t.string :email
        t.string :password_hash
      	t.timestamps
    end

    create_table :surveys do |t|
    	t.integer :user_id
    	t.string :url
        t.string :title
    	t.timestamps
    end

    create_table :participants do |t|
    	t.string :name
    	t.integer :age
    	t.integer :gender
    	t.timestamps
    end

	create_table :participations do |t|
    	t.integer :participant_id
    	t.integer :survey_id
    	t.timestamps
    end

    create_table :questions do |t|
    	t.integer :survey_id
    	t.string :question_text
    	t.timestamps
    end

    create_table :options do |t|
    	t.integer :question_id
    	t.string :option_text
        t.integer :option_num
    	t.timestamps
    end

    create_table :answers do |t|
        t.integer :participation_id
        t.integer :question_id
        t.string :response
        t.timestamps
    end

  end
  
end
