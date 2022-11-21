require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should confirm valid signup account' do
      @user = User.new
      @user.name = "Kevin"
      @user.email = "NewEmail@Kevin.com"
      @user.password = "123"
      @user.password_confirmation = "123"
      @user.save
      expect(@user.valid?).to be true
      end

    it "should give error for wrong password match" do
      @user = User.new
      @user.name = "Kevin"
      @user.email = "Kevin@Kevin.com"
      @user.password = "123"
      @user.password_confirmation = "1"
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    it "should give no error for correct password match" do
      @user = User.new
      @user.name = "Kevin"
      @user.email = "Kevin@Kevin.com"
      @user.password = "123"
      @user.password_confirmation = "123"
      @user.save
      expect(@user.errors.full_messages).to_not include("Password confirmation doesn't match Password")
      end

    it "should not allow case-sensitive email to be used if it exists" do
      @user1 = User.new
      @user1.name = "Kevin"
      @user1.email = "kevin@kevin.com"
      @user1.password = "123"
      @user1.password_confirmation = "123"
      @user1.save

      @user2 = User.new
      @user2.name = "Kevin"
      @user2.email = "KEVIN@KEVIN.com"
      @user2.password = "123"
      @user2.password_confirmation = "123"
      @user2.save

      expect(@user2.id).to_not be_present
      end

    it "should not allow signup if name isn't inputted" do
      @user = User.new
      @user.name = ""
      @user.email = "Kevin@Kevin.com"
      @user.password = "123"
      @user.password_confirmation = "123"
      @user.save
      expect(@user.valid?).to be false
      end

  it "should not allow signup if email isn't inputted" do
    @user = User.new
    @user.name = "Kevin"
    @user.email = ""
    @user.password = "123"
    @user.password_confirmation = "123"
    @user.save
    expect(@user.valid?).to be false
    end

  it "checks that password is minimum 2 length and gives error if not" do
    @user = User.new
    @user.name = "Kevin"
    @user.email = "Kevin@kevin.com"
    @user.password = "1"
    @user.password_confirmation = "1"
    @user.save
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end

  it "checks that password is minimum 2 length and gives no error if so" do
    @user = User.new
    @user.name = "Kevin"
    @user.email = "Kevin@kevin.com"
    @user.password = "123"
    @user.password_confirmation = "123"
    @user.save
    expect(@user.errors.full_messages).to_not include("Password is too short (minimum is 2 characters)")
    end
  end

describe '.authenticate_with_credentials' do
  # examples for this class method here
  it "checks if user is successfully logged in" do
    @user = User.create(name: "Kevin", email: "Email1@email1.com", password: "123", password_confirmation:"123")
    login = User.authenticate_with_credentials("Email1@email1.com", "123");
    expect(login).to eq @user
    end

  it "checks if returns nil if logged in with incorrect pw" do
    @user = User.create(name: "Kevin", email: "Email2@email2.com", password: "123", password_confirmation:"123")
    login = User.authenticate_with_credentials("Email2@email2.com", "1234");
    expect(login).to eq nil
    end

  it "checks if returns nil if logged in with incorrect email" do
    @user = User.create(name: "Kevin", email: "Email3@email3.com", password: "123", password_confirmation:"123")
    login = User.authenticate_with_credentials("Email100@email3.com", "123");
    expect(login).to eq nil
    end

  it "checks if user is logged in with space in email" do
    @user = User.create(name: "Kevin", email: "Email4@email4.com", password: "123", password_confirmation:"123")
    login = User.authenticate_with_credentials("   Email4@email4.com", "123");
    expect(login).to eq @user
    end

    it "checks if user is logged in with case sens in email" do
      @user = User.create(name: "Kevin", email: "Email5@email5.com", password: "123", password_confirmation:"123")
      login = User.authenticate_with_credentials("EMAIL5@EMAIL5.com", "123");
      expect(login).to eq @user
      end
  end
end