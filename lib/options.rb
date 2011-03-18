require 'optparse'
require_relative 'fillform'

module TestLeadForm
  class Options
    attr_reader :url
    attr_reader :submit
    
    def initialize(argv)
      @submit = true
      
      parse(argv)
    end
    
    private 
    
    def parse(argv)
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: testLeadForm.rb [options] [URL]"

        opts.on("-nosubmit", "Do not submit the form") do 
          @submit = false
        end
        
        opts.on("-v", "--version", "Display the version number") do
          puts "Fillform " + Fillform::VERSION.dup
          exit
        end
        
        opts.on("-h", "--help", "Show this message") do 
          puts opts 
          exit
        end
        
        begin 
          #check to see if no arguments at all were passed, if so, show the help info; regardless parse it
          argv = ["-h"] if argv.empty?
          opts.parse!(argv)
          
          #if the argv array is STILL empty, this means options were passed, but no arguments, and this needs the URL argument
          #so check argv again, and show the help if it's still empty
          #if it has data, it will have only the arguments now from the above parsing, so assign the url variable
          if argv.empty?
            argv = ["-h"]
            opts.parse!(argv)
          else
            @url = argv[0]
          end
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
    end #end parse
  end #end Options class
end #end module