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
      "#{name}/app.rb"
    end
  end

  class Dependencies < Fidel
    def destination
      "#{name}/dependencies.rb"
    end
  end

  class Settings < Fidel
    def destination
      "#{name}/settings.rb"
    end
  end

  class Env < Fidel
    def destination
      "#{name}/env.sh"
    end
  end

  class Helpers < Fidel
    def destination
      "#{name}/helpers/helpers.rb"
    end
  end

  class Index < Fidel
    def destination
      "#{name}/routes/index.rb"
    end
  end

  class Home < Fidel
    def destination
      "#{name}/views/home.erb"
    end
  end

  class Layout < Fidel
    def destination
      "#{name}/views/layout.erb"
    end
  end

  class Config < Fidel
    def destination
      "#{name}/config.ru"
    end
  end

  class Makefile < Fidel
    def destination
      "#{name}/makefile"
    end
  end

  class Styles < Fidel
    def destination
      "#{name}/public/css/styles.css"
    end
  end

  class Application < Fidel
    def destination
      "#{name}/public/js/application.js"
    end
  end

end

instructions = <<-EOS
  You have just created a Cuba application. Now, go ahead and install
  the dependencies with the following commands:

    $ cd #{Plan::Fidel.new.name}
    $ make setup   # Creates required dirs
    $ make gems    # Creates a gemset and lists dependencies.
    $ make install # Installs dependencies

  Once you are done with the setup, run the webserver:

    $ rackup

  Now you can head to http://localhost:9292.

  In development mode, it is good to have your application code
  reloaded between requests. For that, we recommend the use of the
  shotgun gem:

    $ gem install shotgun
    $ shotgun

  Both shotgun and rackup use webrick by default:

  Now head to http://localhost:9292 to check your creation. Enjoy!
EOS

puts instructions
puts