#!/home/braxton/.rbenv/shims/ruby
require_relative 'node'

class Tree
	attr_accessor :root, :array, :size

	def initialize(array)
		@array = array
		@root = nil
		@size = 1
	end

	def make_node(item)
		node = @root
		done = false
		until done
			if item >= node.value
				if node.right.nil?
					node.right = Node.new(item, node)
					@size += 1
					done = true
				else
					node = node.right
				end
			else
				if node.left.nil?
					node.left = Node.new(item, node)
					@size += 1
					done = true
				else
					node = node.left
				end
			end
		end
	end

	def build_tree
		@root = Node.new(array[0])
		@array[1...array.size].each { |element| make_node(element) }
	end

	def breadth_first_search(value)
		queue = [@root]
		until queue.empty?
			node = queue.shift
			return node if node.value == value
			queue << node.left unless node.left.nil?
			queue << node.right unless node.right.nil?
		end
		nil
	end

	def depth_first_search(value, visited=[])
		stack = [@root]
		until stack.empty?
			node = stack[-1]
			visited << node
			return node if node.value == value
			if node.left && !(visited.include? node.left)
				stack << node.left
			elsif node.right && !(visited.include? node.right)
				stack << node.right
			else
				stack.pop
			end
		end
		nil
	end

	def dfs_rec(value, node = @root)
		return if @root.nil?
		puts "Node found: #{node.value} #{node}" if node.value == value
		dfs_rec(value, node.left) unless node.left.nil?
		dfs_rec(value, node.right) unless node.right.nil?
	end
end

# array = [7,2,1,9,7,20,3,40,5]
array = Array.new(10) { rand(30) }
p array
my_tree = Tree.new(array)
my_tree.build_tree

puts my_tree.breadth_first_search(array[5])
puts my_tree.breadth_first_search(31)

puts my_tree.depth_first_search(array[3])
puts my_tree.depth_first_search(33)

my_tree.dfs_rec(array[4])
my_tree.dfs_rec(350)

