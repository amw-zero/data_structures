class BST
	attr_accessor :root

	def initialize(root)
		@root = root
	end

	def traverse(&blk)
		_traverse(@root, &blk)
	end

	def insert(node)
		raise 'Must initialize BST with root node' if @root.nil?

		_insert(node, @root)
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

bst = BST.new(Node.new(3))
bst.insert(Node.new(2))
bst.insert(Node.new(4))
bst.insert(Node.new(7))
bst.insert(Node.new(1))
bst.insert(Node.new(1))
bst.insert(Node.new(6))
bst.insert(Node.new(11))
bst.insert(Node.new(19))
bst.insert(Node.new(5))

bst.traverse { |n| puts n.value }

puts bst.find(4)


