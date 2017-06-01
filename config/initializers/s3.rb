Spree.config do |config|
end
Spree.user_class = "Spree::User"
attachment_config = {
    s3_credentials: {
        access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket:            ENV['S3_BUCKET_NAME']
    },

    storage:        :s3,
    s3_protocol:    'https',
    s3_host_name:   's3-us-east-1.amazonaws.com',

    url:            '/spree/:class/:id/:style/:basename.:extension',
    path:           '/spree/:class/:id/:style/:basename.:extension'
}
attachment_config.each do |key, value|
  Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
end