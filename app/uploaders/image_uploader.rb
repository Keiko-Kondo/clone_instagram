class ImageUploader < CarrierWave::Uploader::Base
  storage :file
  include CarrierWave::MiniMagick
  process :resize_to_limit => [200, 400]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  
end
