require 'carrierwave/orm/activerecord'





    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'                        # required
      config.fog_credentials = {
          provider:              'AWS',                        # required
          aws_access_key_id:     'AKIAI54JH5Z56UTGA3TA',        # required
          aws_secret_access_key: '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',        # required
      }
      config.fog_directory = 'opticalnew'
    end



