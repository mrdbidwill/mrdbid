# Configure Obscenity gem for profanity filtering
# https://github.com/tjackiw/obscenity

# Use the default blacklist provided by the gem
# The word list is maintained externally by the gem
Obscenity.configure do |config|
  # Use the default blacklist
  config.blacklist = Obscenity::Base.blacklist

  # You can optionally add custom words to filter
  # config.blacklist += ["custom", "words"]

  # You can also add words to whitelist (words that should NOT be filtered)
  # config.whitelist = ["whitelist", "words"]
end
