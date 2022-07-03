require 'password_checker'

RSpec.describe PasswordChecker do
  it 'checks if passwords are 8 or more characters long' do
    password_checker = PasswordChecker.new
    password_checker.check("password123")
    result = "password123".length >= 8
    expect(result).to eq true
  end

  context 'when password is less that 8 characters long' do
    it "fails" do
      password_checker = PasswordChecker.new
      expect { password_checker.check("pass123") }.to raise_error "Invalid password, must be 8+ characters."
    end
  end
end