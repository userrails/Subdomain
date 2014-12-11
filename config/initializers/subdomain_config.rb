SubdomainFu.configure do |config|
  config.tld_sizes = {:development => 1,
                           :test => 0,
                           :production => 1}
  config.mirrors = %w(www site we) # Defaults to %w(www)
  #config.preferred_mirror = "www"
end