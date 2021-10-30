require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  
  describe 'instructions' do
    user = User.new name: 'Jeremias Ramirez', email: 'example@example.com' 
    mail = UserMailer.new_user_email(user).deliver

    it 'renders the subject' do
      expect(mail.subject).to eq('Welcome to Alkemy-Disney-Api!')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end
  end

end