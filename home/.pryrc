begin
    require 'awesome_print'
      Pry.config.print = proc { |output, value| output.puts value.ai }
      AwesomePrint.pry!
rescue LoadError => err
    puts "no awesome_print :("
end
