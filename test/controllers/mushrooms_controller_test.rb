# frozen_string_literal: true

require 'test_helper'

class MushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mushroom = mushrooms(:one)
  end

  test 'should get index' do
    get mushrooms_url
    assert_response :success
  end

  test 'should get new' do
    get new_mushroom_url
    assert_response :success
  end

  test 'should create mushroom' do
    assert_difference('Mushroom.count') do
      post mushrooms_url,
           params: { mushroom: { comment: @mushroom.comment, description: @mushroom.description, name: @mushroom.name,
                                 user_id: @mushroom.user_id } }
    end

    assert_redirected_to mushroom_url(Mushroom.last)
  end

  test 'should show mushroom' do
    get mushroom_url(@mushroom)
    assert_response :success
  end

  test 'should get edit' do
    get edit_mushroom_url(@mushroom)
    assert_response :success
  end

  test 'should update mushroom' do
    patch mushroom_url(@mushroom),
          params: { mushroom: { comment: @mushroom.comment, description: @mushroom.description, name: @mushroom.name,
                                user_id: @mushroom.user_id } }
    assert_redirected_to mushroom_url(@mushroom)
  end

  test 'should destroy mushroom' do
    assert_difference('Mushroom.count', -1) do
      delete mushroom_url(@mushroom)
    end

    assert_redirected_to mushrooms_url
  end
end
