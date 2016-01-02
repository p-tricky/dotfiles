require 'irb/completion'
require 'map_by_method'
require 'what_methods'
require 'pp'
IRB.conf[:AUTO_INDENT]=true

Kernel.at_exit {  

  File.open("irb.log", "w") do 

    |f|    f << Readline::HISTORY.to_a.join("\n")

 end

}
