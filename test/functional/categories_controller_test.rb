require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  include(Devise::TestHelpers)

  setup do
    @user = User.create! do |user|
      user.full_name = "Test User"
      user.email = "test@example.com"
      user.password = "foo123"
      user.password_confirmation = "foo123"
    end
  end

  test("the create action makes a category") do
    sign_in(@user)

    assert_difference('Category.count') do
      post(:create, :category => {:title => "Hello"})

      assert_redirected_to(:action => :index)
    end
    end

    test("that the new action returns a form") do
      sign_in(@user)
      get(:new)
      assert_response(:success)
      assert_select("form#new_category")
    end
  end
