if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJFSOWJNAFUX3PTJA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['college2.0']
  end
end