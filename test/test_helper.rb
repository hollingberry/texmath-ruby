# Configure $LOAD_PATH
require 'bundler/setup'

# Load texmath
require 'texmath'

# Load testing libraries
require 'minitest/autorun'
require 'minitest/pride' if ENV['SHELL'] == '/bin/zsh'

# Load debugging libraries
require 'pp'
