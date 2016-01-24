require 'ruby-progressbar'

class BST
	attr_accessor :root

	def traverse(&blk)
		_traverse(@root, &blk)
	end

	def insert(node)
		if @root.nil?
			@root = node
		else
			_insert(node, @root)
		end
	end

	def find(v)
		traverse { |n| break n if n.value == v}
	end

	private

	def _insert(node, parent)
		if node.value < parent.value
			if parent.left.nil?
				parent.left = node
			else
				_insert(node, parent.left)
			end
		else
			if parent.right.nil?
				parent.right = node
			else
				_insert(node, parent.right)
			end
		end
	end

	def _traverse(node, &blk)
		return if node.nil?

		_traverse(node.left, &blk)

		yield node

		_traverse(node.right, &blk)
	end
end

class Node
	attr_accessor :value, :left, :right

	def initialize(v)
		@value = v
		@left = nil
		@right = nil
	end

	def to_s
		"v = #{@value} | l = #{@left || 'nil' } | r = #{@right || 'nil'}"
	end
end

def make_random_bst(num_nodes)
	bst = BST.new

	progress = ProgressBar.create(
		total: num_nodes
	)
	puts 'Building tree...'
	num_nodes.times { |i|
		bst.insert(Node.new(rand(i)))
		progress.increment
	}
	bst
end

# bst = make_random_bst(1000)
bst = BST.new

bst.insert(Node.new(5))
bst.insert(Node.new(2))
bst.insert(Node.new(7))
bst.insert(Node.new(9))

puts bst.root

bst.traverse { |n| puts n.value }


