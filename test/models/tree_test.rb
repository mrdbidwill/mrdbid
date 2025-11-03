# test/models/tree_test.rb
require "test_helper"

class TreeTest < ActiveSupport::TestCase
  def setup
    @tree = trees(:one)
  end

  # === Validations ===

  test "should be valid with valid attributes" do
    assert @tree.valid?
  end

  test "should have name attribute" do
    assert_respond_to @tree, :name
  end

  # === Associations ===

  test "should have many mushroom_trees" do
    assert_respond_to @tree, :mushroom_trees
  end

  test "should have many mushrooms through mushroom_trees" do
    assert_respond_to @tree, :mushrooms
  end

  # === Dependent Associations ===

  test "should destroy associated mushroom_trees when tree is destroyed" do
    tree = Tree.create!(name: "Test Tree")
    mushroom = mushrooms(:one)
    MushroomTree.create!(tree: tree, mushroom: mushroom)

    # Preload associations before destroy to satisfy strict_loading
    tree.reload
    tree.mushroom_trees.load
    assert_difference "MushroomTree.count", -1 do
      tree.destroy
    end
  end

  # === CRUD Operations ===

  test "should create new tree" do
    assert_difference "Tree.count", 1 do
      Tree.create!(name: "New Tree")
    end
  end

  test "should update tree attributes" do
    @tree.update(name: "Updated Tree")
    assert_equal "Updated Tree", @tree.reload.name
  end

  test "should delete tree" do
    tree = Tree.create!(name: "Deletable Tree")

    # Preload associations before destroy to satisfy strict_loading
    tree.reload
    tree.mushroom_trees.load
    assert_difference "Tree.count", -1 do
      tree.destroy
    end
  end

  # === Timestamps ===

  test "should have timestamps" do
    assert_not_nil @tree.created_at
    assert_not_nil @tree.updated_at
  end
end