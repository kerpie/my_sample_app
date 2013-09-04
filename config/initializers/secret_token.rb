# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

#SampleApp::Application.config.secret_key_base = '198c6e2352478d89091d17455a225632aa8a5f9a59d1305e788aa6350f93ab85a7f526c9e89af99456789dfc1789c4584d77164627b1f9050740ab72cc2516b1'
SampleApp::Application.config.secret_key_base = secure_token