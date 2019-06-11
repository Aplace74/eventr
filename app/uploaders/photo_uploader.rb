class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'

  version :avatar do
    resize_to_fit 100, 100
  end

end
