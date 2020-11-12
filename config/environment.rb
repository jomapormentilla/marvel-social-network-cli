require 'bundler' 
Bundler.require     # Requires ALL Gems listed in the Gemfile

# API & CLI
require_relative '../lib/api'
require_relative '../lib/cli'

# CLASS MODELS
require_relative '../lib/models/character'