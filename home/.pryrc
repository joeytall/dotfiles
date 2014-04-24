begin
    require '~/.gem/ruby/2.0.0/gems/awesome_print-1.2.0/lib/awesome_print.rb'
      Pry.config.print = proc { |output, value| output.puts value.ai }
      AwesomePrint.pry!
rescue LoadError => err
    puts "no awesome_print :("
end
