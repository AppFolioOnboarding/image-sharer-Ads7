require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.all.order(created_at: :desc)[0]
  end

  def test_index
    get images_path
    assert_response :ok
    assert_select '.card', 2
    assert_select '.card-title', @image.id.to_s
  end

  def test_show
    get image_path(@image.id)

    assert_response :ok
    assert_select '#image-url', @image.url
  end

  def test_new
    get new_image_path
    assert_response :ok
    assert_select '#image_url', 1
    assert_select '#image_tag_list', 1
  end

  def test_create__succeed
    assert_difference('Image.count', 1) do
      image_params = { url: 'http://test12.png', tag_list: 'test, test1, test2' }
      post images_path, params: { image: image_params }
    end
    assert_equal %w(test test1 test2), Image.last.tag_list
    assert_redirected_to image_path(Image.last)
  end

  def test_create__fail
    assert_no_difference('Image.count') do
      image_params = { url: 'teststring' }
      post images_path, params: { image: image_params }
    end
    assert_response :ok
    assert_select '.error', 'Invalid image url'
  end
end
