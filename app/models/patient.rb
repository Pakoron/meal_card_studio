class Patient < ApplicationRecord
    validates :patientid, presence: { message: "を入力して下さい" }
    validates :name, presence: { message: "を入力して下さい" }
    validates :stapleweight, presence: { message: "を入力して下さい" }
end
