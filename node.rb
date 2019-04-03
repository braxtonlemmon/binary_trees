class Node
	attr_accessor :parent, :left, :right
	attr_reader :value
	
	def initialize(value=nil, parent=nil)
		@value = value
		@parent = parent
		@left = nil
		@right = nil
	end
end


	