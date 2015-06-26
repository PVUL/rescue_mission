class Answer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :body, presence: true, length: { minimum: 50 }
  belongs_to :question
end
