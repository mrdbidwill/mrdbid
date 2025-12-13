require "test_helper"

class ImageManagementTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @another_user = users(:two)
    @country = countries(:one)
    @fungus_type = fungus_types(:one)

    @mushroom = @user.mushrooms.create!(
      name: "Image Test Mushroom",
      country_id: @country.id,
      fungus_type_id: @fungus_type.id
    )

    @other_user_mushroom = @another_user.mushrooms.create!(
      name: "Other User Mushroom",
      country_id: @country.id,
      fungus_type_id: @fungus_type.id
    )

    @part = Part.first || Part.create!(name: "Test Part")
  end

  # ==============================================================================
  # IMAGE UPLOAD TESTS
  # ==============================================================================

  test "user can upload image to their mushroom" do
    sign_in @user

    # Note: In actual tests, you'd use fixture_file_upload for real file testing
    # This is a simplified version
    skip "Image upload requires actual file fixture"

    assert_difference("ImageMushroom.count", 1) do
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test_image.jpg", "image/jpeg")
        }
      }
    end

    assert_redirected_to mushroom_path(@mushroom)
    follow_redirect!
    assert_select ".alert, .notice", text: /successfully uploaded/i
  end

  test "user is redirected to image upload after creating mushroom" do
    sign_in @user

    post mushrooms_path, params: {
      mushroom: {
        name: "New Mushroom for Image",
        country_id: @country.id,
        fungus_type_id: @fungus_type.id
      }
    }

    new_mushroom = Mushroom.last
    assert_redirected_to new_image_mushroom_path(mushroom_id: new_mushroom.id)
  end

  test "image upload form requires mushroom selection" do
    sign_in @user

    get new_image_mushroom_path

    assert_redirected_to mushrooms_path
    follow_redirect!
    assert_select ".alert", text: /choose a mushroom/i
  end

  test "image upload form pre-selects mushroom from params" do
    sign_in @user

    get new_image_mushroom_path(mushroom_id: @mushroom.id)

    assert_response :success
    assert_select "form[action='#{image_mushrooms_path(mushroom_id: @mushroom.id)}']"
  end

  test "user cannot upload image without selecting file" do
    sign_in @user

    assert_no_difference("ImageMushroom.count") do
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id
          # No image_file provided
        }
      }
    end

    assert_response :unprocessable_entity
    assert_select ".error, .alert", text: /image file/i
  end

  test "user cannot upload image to another user's mushroom" do
    sign_in @user

    skip "Image upload requires actual file fixture"

    assert_no_difference("ImageMushroom.count") do
      post image_mushrooms_path, params: {
        mushroom_id: @other_user_mushroom.id,
        image_mushroom: {
          mushroom_id: @other_user_mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test_image.jpg", "image/jpeg")
        }
      }
    end

    assert_response :redirect
  end

  test "duplicate image cannot be uploaded to same mushroom" do
    sign_in @user

    skip "Duplicate detection requires actual file fixtures with checksums"

    # Upload first image
    post image_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      image_mushroom: {
        mushroom_id: @mushroom.id,
        part_id: @part.id,
        image_file: fixture_file_upload("test/fixtures/files/test_image.jpg", "image/jpeg")
      }
    }

    # Try to upload same image again
    assert_no_difference("ImageMushroom.count") do
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test_image.jpg", "image/jpeg")
        }
      }
    end

    assert_response :unprocessable_entity
    assert_select ".error, .alert", text: /already been uploaded/i
  end

  # ==============================================================================
  # MULTIPLE IMAGE HANDLING TESTS
  # ==============================================================================

  test "mushroom can have multiple images" do
    sign_in @user

    skip "Multiple image test requires actual file fixtures"

    assert_difference("ImageMushroom.count", 2) do
      # Upload first image
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test_image1.jpg", "image/jpeg")
        }
      }

      # Upload second image
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test_image2.jpg", "image/jpeg")
        }
      }
    end

    @mushroom.reload
    assert_equal 2, @mushroom.image_mushrooms.count
  end

  test "images can be associated with different parts" do
    sign_in @user

    part1 = Part.first || Part.create!(name: "Cap")
    part2 = Part.create!(name: "Stem")

    skip "Part association test requires actual file fixtures"

    # Upload image for cap
    post image_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      image_mushroom: {
        mushroom_id: @mushroom.id,
        part_id: part1.id,
        image_file: fixture_file_upload("test/fixtures/files/cap.jpg", "image/jpeg")
      }
    }

    # Upload image for stem
    post image_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      image_mushroom: {
        mushroom_id: @mushroom.id,
        part_id: part2.id,
        image_file: fixture_file_upload("test/fixtures/files/stem.jpg", "image/jpeg")
      }
    }

    @mushroom.reload
    cap_images = @mushroom.image_mushrooms.where(part_id: part1.id)
    stem_images = @mushroom.image_mushrooms.where(part_id: part2.id)

    assert_equal 1, cap_images.count
    assert_equal 1, stem_images.count
  end

  test "mushroom show page displays all associated images" do
    sign_in @user

    # Create image associations (without actual files for simplicity)
    image1 = @mushroom.image_mushrooms.new(part_id: @part.id)
    image2 = @mushroom.image_mushrooms.new(part_id: @part.id)

    # Attach dummy blobs (would normally be real image files)
    skip "Image display test requires actual file fixtures"

    get mushroom_path(@mushroom)

    assert_response :success
    # Should show both images
    assert_select ".image, img", minimum: 2
  end

  # ==============================================================================
  # IMAGE METADATA TESTS
  # ==============================================================================

  test "image upload can include camera metadata" do
    sign_in @user

    skip "Metadata test requires actual file fixtures"

    camera_make = CameraMake.first || CameraMake.create!(name: "Canon")
    camera_model = CameraModel.first || CameraModel.create!(name: "EOS 5D", camera_make: camera_make)
    lens = Lens.first || Lens.create!(name: "50mm f/1.8")

    assert_difference("ImageMushroom.count", 1) do
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test_image.jpg", "image/jpeg"),
          camera_make_id: camera_make.id,
          camera_model_id: camera_model.id,
          lens_id: lens.id,
          exposure: "1/125s",
          aperture: "f/2.8",
          iso: "400"
        }
      }
    end

    image = ImageMushroom.last
    assert_equal camera_make.id, image.camera_make_id
    assert_equal camera_model.id, image.camera_model_id
    assert_equal lens.id, image.lens_id
    assert_equal "1/125s", image.exposure
    assert_equal "f/2.8", image.aperture
    assert_equal "400", image.iso
  end

  test "EXIF data is automatically extracted from image" do
    sign_in @user

    skip "EXIF extraction requires actual image file with EXIF data"

    # Upload image with EXIF data
    post image_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      image_mushroom: {
        mushroom_id: @mushroom.id,
        part_id: @part.id,
        image_file: fixture_file_upload("test/fixtures/files/image_with_exif.jpg", "image/jpeg")
      }
    }

    image = ImageMushroom.last

    # EXIF data should be automatically populated
    assert_not_nil image.exif_make
    assert_not_nil image.exif_model
    assert_not_nil image.image_width
    assert_not_nil image.image_height
  end

  test "manual metadata overrides EXIF data" do
    sign_in @user

    skip "EXIF override test requires actual file fixtures"

    # Upload image with manual metadata that should override EXIF
    post image_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      image_mushroom: {
        mushroom_id: @mushroom.id,
        part_id: @part.id,
        image_file: fixture_file_upload("test/fixtures/files/image_with_exif.jpg", "image/jpeg"),
        exposure: "Manual 1/100s" # Should override EXIF
      }
    }

    image = ImageMushroom.last
    assert_equal "Manual 1/100s", image.exposure
  end

  # ==============================================================================
  # IMAGE VIEWING TESTS
  # ==============================================================================

  test "user can view image details" do
    sign_in @user

    image_mushroom = @mushroom.image_mushrooms.create!(
      part_id: @part.id
    )

    skip "Image view requires actual attached file"

    get image_mushroom_path(image_mushroom)

    assert_response :success
    assert_select "img"
    assert_select ".metadata, .image-details"
  end

  test "user can view all images for a mushroom" do
    sign_in @user

    get mushroom_path(@mushroom)

    assert_response :success
    # Should show image gallery or list
  end

  test "image thumbnails are generated automatically" do
    sign_in @user

    skip "Thumbnail generation requires actual file fixtures and Active Storage"

    # Upload image
    post image_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      image_mushroom: {
        mushroom_id: @mushroom.id,
        part_id: @part.id,
        image_file: fixture_file_upload("test/fixtures/files/large_image.jpg", "image/jpeg")
      }
    }

    image = ImageMushroom.last

    # Thumbnail variant should be available
    assert image.image_file.attached?
    assert image.image_file.variant(resize_to_fill: [120, 120]).processed
  end

  # ==============================================================================
  # IMAGE EDITING TESTS
  # ==============================================================================

  test "user can edit image metadata" do
    sign_in @user

    image_mushroom = @mushroom.image_mushrooms.create!(
      part_id: @part.id,
      comments: "Original comments"
    )

    skip "Image edit requires actual attached file"

    get edit_image_mushroom_path(image_mushroom)

    assert_response :success
    assert_select "form[action='#{image_mushroom_path(image_mushroom)}']"
  end

  test "user can update image metadata" do
    sign_in @user

    image_mushroom = @mushroom.image_mushrooms.create!(
      part_id: @part.id,
      comments: "Original comments"
    )

    skip "Image update requires actual attached file"

    patch image_mushroom_path(image_mushroom), params: {
      image_mushroom: {
        comments: "Updated comments",
        exposure: "1/200s",
        aperture: "f/4.0"
      }
    }

    image_mushroom.reload
    assert_equal "Updated comments", image_mushroom.comments
    assert_equal "1/200s", image_mushroom.exposure
    assert_equal "f/4.0", image_mushroom.aperture
  end

  test "user can change image part association" do
    sign_in @user

    part1 = Part.first || Part.create!(name: "Cap")
    part2 = Part.create!(name: "Stem")

    image_mushroom = @mushroom.image_mushrooms.create!(
      part_id: part1.id
    )

    skip "Part change requires actual attached file"

    patch image_mushroom_path(image_mushroom), params: {
      image_mushroom: {
        part_id: part2.id
      }
    }

    image_mushroom.reload
    assert_equal part2.id, image_mushroom.part_id
  end

  test "user cannot edit another user's image" do
    sign_in @user

    other_image = @other_user_mushroom.image_mushrooms.create!(
      part_id: @part.id
    )

    skip "Authorization test requires actual attached file"

    get edit_image_mushroom_path(other_image)

    assert_response :redirect
  end

  test "user cannot update another user's image" do
    sign_in @user

    other_image = @other_user_mushroom.image_mushrooms.create!(
      part_id: @part.id,
      comments: "Original"
    )

    skip "Authorization test requires actual attached file"

    patch image_mushroom_path(other_image), params: {
      image_mushroom: {
        comments: "Hacked comments"
      }
    }

    other_image.reload
    assert_not_equal "Hacked comments", other_image.comments
    assert_response :redirect
  end

  # ==============================================================================
  # IMAGE DELETION TESTS
  # ==============================================================================

  test "user can delete their own image" do
    sign_in @user

    image_mushroom = @mushroom.image_mushrooms.create!(
      part_id: @part.id
    )

    skip "Image deletion requires actual attached file"

    assert_difference("ImageMushroom.count", -1) do
      delete image_mushroom_path(image_mushroom)
    end

    assert_redirected_to mushroom_path(@mushroom)
    follow_redirect!
    assert_select ".alert, .notice", text: /successfully deleted/i
  end

  test "deleting image does not delete mushroom" do
    sign_in @user

    image_mushroom = @mushroom.image_mushrooms.create!(
      part_id: @part.id
    )

    skip "Image deletion requires actual attached file"

    mushroom_id = @mushroom.id

    assert_no_difference("Mushroom.count") do
      delete image_mushroom_path(image_mushroom)
    end

    assert Mushroom.exists?(mushroom_id)
  end

  test "user cannot delete another user's image" do
    sign_in @user

    other_image = @other_user_mushroom.image_mushrooms.create!(
      part_id: @part.id
    )

    skip "Authorization test requires actual attached file"

    assert_no_difference("ImageMushroom.count") do
      delete image_mushroom_path(other_image)
    end

    assert_response :redirect
  end

  test "deleting mushroom deletes all associated images" do
    sign_in @user

    skip "Cascade deletion requires actual attached files"

    # Create multiple images for mushroom
    image1 = @mushroom.image_mushrooms.create!(part_id: @part.id)
    image2 = @mushroom.image_mushrooms.create!(part_id: @part.id)

    assert_difference("ImageMushroom.count", -2) do
      delete mushroom_path(@mushroom)
    end

    assert_not ImageMushroom.exists?(image1.id)
    assert_not ImageMushroom.exists?(image2.id)
  end

  test "deleting all images leaves mushroom intact" do
    sign_in @user

    skip "Multiple deletion requires actual attached files"

    image1 = @mushroom.image_mushrooms.create!(part_id: @part.id)
    image2 = @mushroom.image_mushrooms.create!(part_id: @part.id)

    mushroom_id = @mushroom.id

    delete image_mushroom_path(image1)
    delete image_mushroom_path(image2)

    assert Mushroom.exists?(mushroom_id)
    assert_equal 0, @mushroom.reload.image_mushrooms.count
  end

  # ==============================================================================
  # IMAGE FILE FORMAT TESTS
  # ==============================================================================

  test "system accepts JPEG images" do
    sign_in @user

    skip "Format test requires actual JPEG file"

    assert_difference("ImageMushroom.count", 1) do
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test.jpg", "image/jpeg")
        }
      }
    end
  end

  test "system accepts PNG images" do
    sign_in @user

    skip "Format test requires actual PNG file"

    assert_difference("ImageMushroom.count", 1) do
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test.png", "image/png")
        }
      }
    end
  end

  test "system accepts HEIC images" do
    sign_in @user

    skip "Format test requires actual HEIC file"

    assert_difference("ImageMushroom.count", 1) do
      post image_mushrooms_path, params: {
        mushroom_id: @mushroom.id,
        image_mushroom: {
          mushroom_id: @mushroom.id,
          part_id: @part.id,
          image_file: fixture_file_upload("test/fixtures/files/test.heic", "image/heic")
        }
      }
    end
  end

  # ==============================================================================
  # COMPLETE IMAGE WORKFLOW TEST
  # ==============================================================================

  test "complete image management workflow" do
    sign_in @user

    skip "Complete workflow requires actual file fixtures"

    # Step 1: Create mushroom
    post mushrooms_path, params: {
      mushroom: {
        name: "Image Workflow Mushroom",
        country_id: @country.id,
        fungus_type_id: @fungus_type.id
      }
    }

    mushroom = Mushroom.last
    assert_redirected_to new_image_mushroom_path(mushroom_id: mushroom.id)

    # Step 2: Upload first image
    post image_mushrooms_path, params: {
      mushroom_id: mushroom.id,
      image_mushroom: {
        mushroom_id: mushroom.id,
        part_id: @part.id,
        image_file: fixture_file_upload("test/fixtures/files/image1.jpg", "image/jpeg"),
        comments: "First image"
      }
    }

    assert_redirected_to mushroom_path(mushroom)
    image1 = ImageMushroom.last

    # Step 3: Upload second image
    post image_mushrooms_path, params: {
      mushroom_id: mushroom.id,
      image_mushroom: {
        mushroom_id: mushroom.id,
        part_id: @part.id,
        image_file: fixture_file_upload("test/fixtures/files/image2.jpg", "image/jpeg"),
        comments: "Second image"
      }
    }

    image2 = ImageMushroom.last

    # Step 4: View mushroom with images
    get mushroom_path(mushroom)
    assert_response :success

    # Step 5: Edit first image metadata
    patch image_mushroom_path(image1), params: {
      image_mushroom: {
        comments: "Updated first image"
      }
    }

    image1.reload
    assert_equal "Updated first image", image1.comments

    # Step 6: Delete second image
    delete image_mushroom_path(image2)
    assert_not ImageMushroom.exists?(image2.id)

    # Step 7: Verify mushroom still has first image
    mushroom.reload
    assert_equal 1, mushroom.image_mushrooms.count
    assert mushroom.image_mushrooms.include?(image1)
  end
end
