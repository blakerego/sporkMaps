# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sporkWeb_session',
  :secret      => '4c09656c7d2c01ac12677d08a369367acddda6eadb63e3128d4f5b358eae2c97273b43745c041ffe54d7a85d9cabe78369f47bc69dfa87844b170e6f10b7fc93'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
