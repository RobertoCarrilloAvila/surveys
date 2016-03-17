class CrearUser < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      	t.string :name 
  		t.string :email
  		t.string :password_digest

      	t.timestamps
    end


    create_table :surveys do |t|
  		t.string :title
      	t.belongs_to :user, index: true

      	t.timestamps
    end


    create_table :questions do |t|
  		t.string :description
      	t.belongs_to :survey, index: true

      	t.timestamps
    end


    create_table :answers do |t|
  		t.string :description
      	t.belongs_to :question, index: true

      	t.timestamps
    end

  end
end
