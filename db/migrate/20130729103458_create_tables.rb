class CreateTables < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string   :user_name
    end

    create_table :tweets do |t|
      t.integer   :twitter_user_id
      t.string    :text
      t.date      :tweet_creation_time
      t.timestamps
    end

  end
end
