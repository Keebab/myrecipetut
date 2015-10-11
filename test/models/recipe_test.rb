require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(title: "chicken meatballs", summary: "This is one sexy, spicy meatball", 
    description: "Holy fuckballs can you believe how awesome these meatballs are.")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end  
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "title should be present" do
    @recipe.title = "  "
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.title = "a" * 101
    assert_not @recipe.valid?
  end  
  
  test "name length should not be too short" do
    @recipe.title = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "Summary must be present" do
    @recipe.summary = "   "
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "Description must be present" do
    @recipe.description = "   "
    assert_not @recipe.valid?
  end
  
  test "Description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "Description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
end  