class Configuration
  
  class << self
    def host; ''; end
    def port; 5433; end
    def database; ''; end
    def username; 'dbadmin'; end
    def password; ''; end
    
    def [](key)
      send(key)
    end
  end
end