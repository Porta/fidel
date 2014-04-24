require "digest/sha1"
require "base64"
module Plan

  class Fidel

    def name
      "bar"
    end
    
    def random
      Digest::SHA1.hexdigest(name + Time.now.to_f.to_s)
    end

    def gems
      [
        "cuba",
        "cuba-contrib",
        "cuba-render",
        "cuba-sugar",
        "cuba-test",
        "malone",
        "ohm",
        "ohm-contrib",
        "ost",
        "scrivener",
        "armor",
        "shield",
        "logger",
        "rack-protection",
        "rack-test",
        "rack-uploads",
        #"rack-throttle",
        "shotgun"
      ]
    end

    def destination
      "app.rb"
    end
  end

  class Dependencies < Fidel
    def destination
      "dependencies.rb"
    end
  end

  class Settings < Fidel
    def destination
      "settings.rb"
    end
  end

  class Env < Fidel
    def destination
      "env.sh"
    end
  end

  class Helpers < Fidel
    def destination
      "helpers/helpers.rb"
    end
  end

  class Index < Fidel
    def destination
      "routes/index.rb"
    end
  end

  class Home < Fidel
    def destination
      "views/home.erb"
    end
  end

  class Layout < Fidel
    def destination
      "views/layout.erb"
    end
  end

end