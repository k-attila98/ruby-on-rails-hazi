require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "cannot save user without name" do
    u = User.new email: "asd@asd.hu", password_digest: "asdasd"
    assert !u.save, "Baj van!"
  end

  test "cannot save user without email" do
    u = User.new name: "asd", password_digest: "asdasd"
    assert !u.save, "Baj van!"
  end

  test "cannot save user without password" do
    u = User.new name: "asd", password_digest: "asdasd"
    assert !u.save, "Baj van!"
  end

  test "cannot save user with existing email" do
    u = User.new email: users(:user_one).email
    assert !u.save, "Baj van!"
  end

  test "password encryption correct" do
    u = User.find users(:user_one).id
    assert u&.authenticate("komuveles"), "A titkosítás nem elég jó ://"
  end

  test "password encryption wrong pass" do
    u = User.find users(:user_one).id
    assert !u&.authenticate("komuvelo"), "A titkosítás nem elég jó ://"
  end
end
