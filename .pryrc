if defined?("::Bundler")
  current_gemset = ENV["GEM_HOME"]
  $LOAD_PATH.concat(Dir.glob("#{current_gemset}/gems/*/lib")) if current_gemset
end

require "rb-readline"
require "readline" if defined?("RbReadline")

# No need for the shell functionality, it breaks pasting multiline code with leading dots
Pry.commands.delete(/\.(.*)/)

def RbReadline.rl_reverse_search_history(sign, key)
  rl_insert_text `cat ~/.pry_history | fzf --multi --no-sort --height 15 --tac | perl -pi -e 'chomp if eof'`
end

def benchmark_time(repetitions = 100, &block)
  require "benchmark"
  Benchmark.bm { |b| b.report { repetitions.times(&block) } }
end
