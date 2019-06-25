# == Schema Information
#
# Table name: users
#
#  id                             :bigint           not null, primary key
#  username                       :string           not null
#  email                          :string           not null
#  description                    :text             not null
#  pet_type                       :string           not null
#  hosting_preferences            :string           not null
#  size_preference_for_hosting    :string           not null
#  size_preference_for_travelling :string           not null
#  password_digest                :string           not null
#  session_token                  :string           not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null


class User < ApplicationRecord

    attr_reader :password

    validates :username, :password_digest, :session_token, :email, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }

    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        user && user.is_password?(password) ? user : allow_nil
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end
end