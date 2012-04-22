# Thanks for http://stackoverflow.com/questions/8490528/how-can-i-make-jekyll-use-a-layout-without-specifying-it

module Jekyll
  module Convertible
    IMPLICIT_LAYOUT = 'default'

    def read_yaml(base, name)
      self.content = File.read(File.join(base, name))
      self.data    = { "layout" => IMPLICIT_LAYOUT }

      begin
        if self.content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
          self.content = $POSTMATCH
          self.data.update(YAML.load($1))
          # Maybe consider https://github.com/mojombo/jekyll/issues/453
        end
      rescue => e
        puts "YAML Exception reading #{name}: #{e.message}"
      end
    end
  end
end
