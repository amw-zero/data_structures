import random

class Node:
	def __init__(self, value):
		self.value = value
		self.left = None
		self.right = None

class BST:
	def __init__(self):
		self.root = None

	def insert(self, node):
		if self.root == None:
			self.root = node
		else:
			self.__insert(node, self.root)

	def __insert(self, node, root):
		print("inserting")
		if node.value < root.value:
			if root.left == None:
				root.left = node
			else:
				self.__insert(node, root.left)
		else:
			if root.right == None:
				root.right = node
			else:
				self.__insert(node, root.right)

	def traverse_inorder(self, fn):
		self.__traverse_inorder(self.root, fn)

	def __traverse_inorder(self, root, fn):
		if root == None:
			return

		self.__traverse_inorder(root.left, fn)
		fn(root)
		self.__traverse_inorder(root.right, fn)



def print_node(n):
	print(n.value)

bst = BST()

inputs = [random.randint(1, 100) for _ in range(0, 100)]
for i in inputs:
	bst.insert(Node(i))

bst.traverse_inorder(print_node)


