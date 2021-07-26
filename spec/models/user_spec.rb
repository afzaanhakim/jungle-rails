require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations: ' do
    it "user is valid when all fields meet criterias" do
      @user = User.new
      @user.first_name = "John"
      @user.last_name = "Smith"
      @user.email = "abc@xyz.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to be_valid
  end

  it "user password confirmation is invalid when passwords don't match" do
    @user = User.new
    @user.first_name = "John"
    @user.last_name = "Smith"
    @user.email = "abc@xyz.com"
    @user.password = "password"
    @user.password_confirmation = "password123"
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
end

it "user is invalid when first name field is empty" do
  @user = User.new
  @user.first_name = nil
  @user.last_name = "Smith"
  @user.email = "abc@xyz.com"
  @user.password = "password"
  @user.password_confirmation = "password"
  expect(@user).to_not be_valid
  expect(@user.errors.full_messages).to include "First name can't be blank"
end

it "user is invalid when last name field is empty" do
  @user = User.new
  @user.first_name = "John"
  @user.last_name = nil
  @user.email = "abc@xyz.com"
  @user.password = "password"
  @user.password_confirmation = "password"
  expect(@user).to_not be_valid
  expect(@user.errors.full_messages).to include "Last name can't be blank"
end

it "user is invalid when email field is empty" do
  @user = User.new
  @user.first_name = "John"
  @user.last_name = "Smith"
  @user.email = nil
  @user.password = "password"
  @user.password_confirmation = "password"
  expect(@user).to_not be_valid
  expect(@user.errors.full_messages).to include "Email can't be blank"
end

it "user is invalid when password field is less than 5 characters" do
  @user = User.new
  @user.first_name = "John"
  @user.last_name = "Smith"
  @user.email = "xyz@abc.com"
  @user.password = "pass"
  @user.password_confirmation = "pass"
  expect(@user).to_not be_valid
  expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
end


it "user is invalid when email is not unique" do
  @user = User.new
  @user.first_name = "John"
  @user.last_name = "Smith"
  @user.email = "xyz@abc.com"
  @user.password = "password"
  @user.password_confirmation = "password"
user2 = User.create(first_name: "Jane",
last_name: "Doe",
email: "XYZ@abc.com",
password: "password",
password: "password")
  expect(@user).to_not be_valid
  expect(@user.errors.full_messages).to include "Email has already been taken"
end

end
end
