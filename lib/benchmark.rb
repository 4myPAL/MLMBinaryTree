require 'benchmark'
require 'rubygems'

Benchmark.bm do |x|
  x.report { 
    node = Network.find(1)
    networks = Network.get_tree(node)
  }
end