::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "lK4WhpEEUImhR0Bu9J_tfTbrWF_J0NSKYWlHjd0S"
  config.qiniu_secret_key    = 'itYRK5QT4ikp2hvKLB2h1aM5aTCQPRsuWMwlYn9F'
  config.qiniu_bucket        = "q7185"
  config.qiniu_bucket_domain = "q7185.qiniudn.com"
  config.qiniu_bucket_private= true #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
end