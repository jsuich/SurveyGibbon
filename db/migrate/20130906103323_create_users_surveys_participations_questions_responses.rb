class Create_Users_Surveys_Participations_Questions_Responses < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      	t.string :email
      	t.string :password_hash

      	t.timestamps
    end

    create_table :surveys do |t|
    	t.integer :user_id
    	t.string :title
    	t.timestamps
    end

    create_table :participants do |t|
    	t.string :name
    	t.integer :age
    	t.string :gender
    	t.timestamps
    end

	create_table :participations do |t|
    	t.integer :participants_id
    	t.integer :survey_id
    	t.timestamps
    end

    create_table :questions do |t|
    	t.integer :survey_id
    	t.string :prompt
    	t.timestamps
    end

    create_table :answers do |t|
    	t.integer :participations_id
    	t.integer :questions_id
    	t.string :response
    	t.timestamps
    end

  end
  
end
