class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::RMagick

  version :thumb do 
    process :resize_to_limit => [200, 200]
  end

  storage :file

  def store_dir
    'images'
  end
end
