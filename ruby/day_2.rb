some_numbers = [2, 4, 6, 8, 10, 12, 14, 18, 1, 3, 5, 7, 9, 11, 13, 15]

puts "The hard way"
(0..3).each { |i| p some_numbers[(i*4)..(i*4+3)] }

puts "And now the easy way"
some_numbers.each_slice(4) { |a| p a }




class Tree
  attr_accessor :children, :node_name

  def initialize(tree_hash={})
    @node_name = tree_hash.keys[0]
    @children = tree_hash[@node_name].collect { |n, c| Tree.new({n => c}) }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end



def grep(filename, phrase)
  line_number = 0
  File.open(filename) { |file| file.readlines("\n").each { |line| line_number+=1; puts "#{line_number}: #{line}" unless line.match(phrase).nil? } }
#  File.open(filename) { |file| file.readlines("\n").each { |line, line_number| puts "#{line_number}: #{line}" unless line.match(phrase).nil? } }
# look into to_enum.with_index
end
