class User < ApplicationRecord
    validates :name,presence: { message: "を入力して下さい" }
    validates :password, presence: { message: 'を入力してください' },length: { minimum: 5 ,message: 'は５文字以上入力して下さい'}
    has_secure_password validations: false
end
