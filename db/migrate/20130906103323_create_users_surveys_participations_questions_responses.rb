class Create_Users_Surveys_Participations_Questions_Responses < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      	t.string :email
      	t.string :password_hash

      	t.timestamps
    end
  end
end
