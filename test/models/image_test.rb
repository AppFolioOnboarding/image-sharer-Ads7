require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'save image without url' do
    image = Image.new
    assert_not image.save, 'Saved image without url'
  end

  test 'save image with invalid url' do
    image = Image.new('url': 'test')
    assert_not image.save
  end

  test 'create valid image' do
    IMAGE_URL = 'https://test.jpeg'.freeze
    total_count = Image.all.count
    image = Image.new('url': IMAGE_URL)
    assert image.save
    image1 = Image.find_by('url': IMAGE_URL)
    assert_equal IMAGE_URL, image1.url
    assert_equal total_count + 1, Image.all.count
  end
end
