require "test_helper"

#  create_table "posts", force: :cascade do |t|
#     t.string "petname", null: false
#     t.integer "age", null: false
#     t.text "description", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.bigint "user_id", null: false
#     t.string "species", null: false
#     t.index ["user_id"], name: "index_posts_on_user_id"
#   end

#  test "cannot save post without age" do
#     p = Post.new petname: "Lori", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", species: "asdasd", user: :user_one, age: 3
#     assert !p.save, "Baj van!"
#   end


class PostTest < ActiveSupport::TestCase
  test "cannot save post without petname" do
    p = Post.new description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", species: "asdasd", user: :user_one, age: 3
    assert !p.save, "Baj van!"
  end

  test "cannot save post without age" do
    p = Post.new petname: "Lori", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", species: "asdasd", user: :user_one
    assert !p.save, "Baj van!"
  end

  test "cannot save post without description" do
    p = Post.new petname: "Lori", species: "asdasd", user: :user_one, age: 3
    assert !p.save, "Baj van!"
  end

  test "cannot save post without species" do
    p = Post.new petname: "Lori", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", user: :user_one, age: 3
    assert !p.save, "Baj van!"
  end

  test "cannot save post without user" do
    p = Post.new petname: "Lori", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", species: "asdasd", age: 3
    assert !p.save, "Baj van!"
  end
end
