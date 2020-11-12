require 'digest/md5'

class API
    attr_reader :url_base, :ts, :public_key, :private_key, :req_hash

    def initialize
        md5 = Digest::MD5.new

        @url_base = "https://gateway.marvel.com/v1/public/"
        @ts = Time.now.getutc.to_i
        @public_key = "fbe44fa0f4dee8178eef0305efe6aa13"
        @private_key = "e76914d91980041a83f05887f76a2fafbf8e7822"

        string = @ts.to_s + @private_key + @public_key
        md5 << string
        @req_hash = md5.hexdigest

        start
    end

    def start
        # Load all data from APIs
        get_spells
        get_houses
        get_characters
    end

    def get_data( type )
        url = "#{ @url_base }#{ type }?ts=#{ @ts }&apikey=#{ @public_key }&hash=#{ @req_hash }"
        uri = URI( url )                    # Turns the URL into an HTTP Object that we can use in our program
        response = Net::HTTP.get( uri )     # Returns a response as a String Object
        arr = JSON.parse( response )        # Converts the response String to a JSON format
    end

    def start
        get_data("characters")
        binding.pry
    end
end