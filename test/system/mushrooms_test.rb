# frozen_string_literal: true

require 'application_system_test_case'

class MushroomsTest < ApplicationSystemTestCase
  setup do
    @mushroom = mushrooms(:one)
  end

  test 'visiting the index' do
    visit mushrooms_url
    assert_selector 'h1', text: 'Mushrooms'
  end

  test 'should create mushroom' do
    visit mushrooms_url
    click_on 'New mushroom'

    fill_in 'Comment', with: @mushroom.comment
    fill_in 'Description', with: @mushroom.description
    fill_in 'Name', with: @mushroom.name
    fill_in 'User', with: @mushroom.user_id
    click_on 'Create Mushroom'

    assert_text 'Mushroom was successfully created'
    click_on 'Back'
  end

  test 'should update Mushroom' do
    visit mushroom_url(@mushroom)
    click_on 'Edit this mushroom', match: :first

    fill_in 'Comment', with: @mushroom.comment
    fill_in 'Description', with: @mushroom.description
    fill_in 'Name', with: @mushroom.name
    fill_in 'User', with: @mushroom.user_id
    click_on 'Update Mushroom'

    assert_text 'Mushroom was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Mushroom' do
    visit mushroom_url(@mushroom)
    accept_confirm { click_on 'Destroy this mushroom', match: :first }

    assert_text 'Mushroom was successfully destroyed'
  end
end
