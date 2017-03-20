
// File:        rbtree.h
// Author:      Geoffrey Tien
// Date:        2016-06-05
// Description: Declaration of a RBTree class and template Node class for use with CPSC 221 assignment #3
//              You may add your own private member function declarations in rbtreeprivate.h

#ifndef _RBTREE_H_
#define _RBTREE_H_

#include <string>
using namespace std;

template <typename T>
class Node
{
public:
	T data;
	Node<T>* left;
	Node<T>* right;
	Node<T>* p;     // parent pointer
	bool is_black;

	// parameterized constructor
	Node(T value)
	{
		data = value;
		left = NULL;
		right = NULL;
		p = NULL;
		is_black = false;
	}
};

template <typename T>
class RBTree
{
private:
	Node<T>* root;
	int size;

	// recursive helper function for deep copy
	// creates a new node based on sourcenode's contents, links back to parentnode,
	//   and recurses to create left and right children
	Node<T>* CopyTree(Node<T>* sourcenode, Node<T>* parentnode);

	// recursive helper function for tree deletion
	// deallocates nodes in post-order
	void RemoveAll(Node<T>* node);

	// performs BST insertion and returns pointer to inserted node
	// Note that this should only be called if item does not already exist in the tree
	// Does not increase tree size.
	Node<T>* BSTInsert(T item);

	// helper function for in-order traversal
	void InOrder(const Node<T>* node, T* arr, int arrsize, int& index) const;

	// helper function for pre-order traversal
	void PreOrder(const Node<T>* node, T* arr, int arrsize, int& index) const;

	// rotation functions
	void RotateLeft(Node<T>* node);
	void RotateRight(Node<T>* node);

	// get the predecessor of a node
	Node<T>* Predecessor(Node<T>* node) const;

	// Searches for a key value and returns a pointer to the node containing it, or NULL if not found
	Node<T>* Find(T item) const;

	// Tree fix, performed after removal of a black node
	// Note that the parameter x may be NULL
	void RBRemoveFixUp(Node<T>* x, Node<T>* xparent, bool xisleftchild);

	// Calculates the height of the tree
	// Requires a traversal of the tree, O(n)
	int ComputeHeight(Node<T>* node) const;

	// write your own private function declarations in the following file, if needed
#include "rbtreeprivate.h"

public:
	// default constructor
	RBTree();

	// copy constructor, performs deep copy of parameter
	RBTree(const RBTree<T>& rbtree);

	// destructor
	// Must deallocate memory associated with all nodes in tree
	~RBTree();

	// overloaded assignment operator
	RBTree<T>& operator=(const RBTree<T>& rbtree);

	// Accessor functions

	// Calls BSTInsert and then performs any necessary tree fixing.
	// If item already exists, do not insert and return false.
	// Otherwise, insert, increment size, and return true.
	bool Insert(T item);

	// Removal of an item from the tree.
	// Must deallocate deleted node after RBDeleteFixUp returns
	bool Remove(T item);

	// Returns existence of item in the tree.
	// Return true if found, false otherwise.
	bool Contains(T item) const;

	// Searches for item and returns a pointer to the node contents so the
	//   value may be accessed or modified. Returns NULL if item is not in the tree
	// Use with caution! Do not modify the item's key value such that the
	//   red-black / BST properties are violated.
	T* Retrieve(T item);

	// deletes all nodes in the tree. Calls recursive helper function.
	void RemoveAll();

	// returns an array containing tree contents from in-order traversal
	// arrsize is the size of the returned array (equal to tree size attribute)
	T* DumpInOrder(int& arrsize) const;

	// returns an array containing tree contents from pre-order traversal
	// arrsize is the size of the returned array (equal to tree size attribute)
	T* DumpPreOrder(int& arrsize) const;

	// returns the number of items in the tree
	int Size() const;

	// returns the height of the tree, from root to deepest null child. Calls recursive helper function.
	// Note that an empty tree should have a height of 0, and a tree with only one node will have a height of 1.
	int Height() const;

	// returns a pointer to the root of the tree
	// NOTE: This will be used only for grading.
	// Providing node-level access to the tree internals is dangerous in practice!
	Node<T>* GetRoot() const
	{
		return this->root;
	}
};

// include functions completed by instructor
#include "rbtreepartial.cpp"
// include functions to be completed by yourself
#include "rbtree.cpp"

#endif