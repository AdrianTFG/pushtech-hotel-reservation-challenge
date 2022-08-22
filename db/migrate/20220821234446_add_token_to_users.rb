class AddTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token, :string
    add_index :users, :token, unique: true

    User.all.each do |user|
      token_seted = false
      while !token_seted
        random_token = SecureRandom.hex(10)
        if User.find_by_token(random_token).nil?
          execute "UPDATE users SET token='#{random_token}' WHERE id=#{user.id}"
          token_seted = true
        end
      end
    end
  end
end
