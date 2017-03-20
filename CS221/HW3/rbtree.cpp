// File:        rbtree.cpp
// Author:      Shamsuddin Rehmani
// Date:        2016-14-05
// Description: Contains implementation of remaining RBTree functions.
//              

#ifdef _RBTREE_H_
<include iostream>

// recursive helper function for deep copy
// creates a new node based on sourcenode's contents, links back to parentnode,
// and recurses to create left and right children
template <typename T>
Node<T>* RBTree<T>::CopyTree(Node<T>* sourcenode, Node<T>* parentnode) {
	
	//this takes care of the copying empty tree and also when the recursion reaches leafnode 
	if (sourcenode == NULL)
		return NULL;

	else {
		//create a newNode with data from sourcenode
		Node<T>* newNode = new Node<T>(sourcenode->data);
		//set the parent of the newNode as the parentnode argument from the function
		newNode->p = parentnode;
		//copy the color of the sourcenode to newNode
		newNode->is_black = sourcenode->is_black;
		//to set the right child of the newNode we recurse until we reach the leaf node, set it right child NULL
		//then left child NULL and proceed setting the right and left from bottom to top of the tree until we
		//reach the root which is the newNode for the first recursive call.
		newNode->right = CopyTree(sourcenode->right, newNode );
		newNode->left = CopyTree(sourcenode->left, newNode);
		return newNode;
	}

}

// recursive helper function for tree deletion
// deallocates nodes in post-order
template <typename T>
void RBTree<T>::RemoveAll(Node<T>* node) {

	if (node == NULL)
		return;
	
	else {

		RemoveAll(node->left);
		RemoveAll(node->right);	
		delete node;
		//--size;
		node = NULL;	
	}
	node = NULL;
}

// Tree fix, performed after removal of a black node
// Note that the parameter x may be NULL
template <typename T>
void RBTree<T>::RBRemoveFixUp(Node<T>* x, Node<T>* xparent, bool xisleftchild) {

	Node<T>* y;

	while (x != root && (x == NULL || x->is_black == true))
	{
		if (xisleftchild) {
			//cout << "In the  if block (the leftchildcase)" << endl;
			y = xparent->right;
			
			if (y != NULL && y->is_black == false) {
				y->is_black = true;
				xparent->is_black = false;
				RotateLeft(xparent);
				y = xparent->right;
				//cout << "In the if->1st_if block of the leftchildcase" << endl;
			}
			if(y != NULL && ((y->left == NULL && y->right == NULL)
				||( y->left->is_black && y->right->is_black ))){
				
				y->is_black = false;
				x = xparent;
				xparent = xparent->p;
				//cout << "In the if->2nd_if block of the leftchildcase" << endl;
				
			}
			else {
				//cout << "In the if->else block (the leftchildcase)" << endl;
				if (y != NULL && (y->right == NULL || y->right->is_black)) {

					//cout << "In the else->1st_if block of the leftchildcase" << endl;
					if (y->left != NULL)
						y->left->is_black = true;
					y->is_black = false;
					RotateRight(y);
					y = xparent->right;
				}
				if (y != NULL)
					y->is_black = xparent->is_black;
				xparent->is_black = true;
				if (y != NULL && y->right != NULL)
					y->right->is_black = true;
				RotateLeft(xparent);
				x = root;
			}
		}
		else {
			//cout << "In the  else block (the rightchildcase)" << endl;
			y = xparent->left;

			if (y != NULL && y->is_black == false) {
				y->is_black = true;
				xparent->is_black = false;
				RotateRight(xparent);
				y = xparent->left;
				//cout << "In the else->1st_if block of the leftchildcase" << endl;
			}
			if (y != NULL && ((y->left == NULL && y->right == NULL)
				|| (y->left->is_black && y->right->is_black))) {

				y->is_black = false;
				x = xparent;
				xparent = xparent->p;
				//cout << "In the else->2nd_if block of the leftchildcase" << endl;

			}
			else {
				//cout << "In the else block of the leftchildcase" << endl;
				if (y != NULL && (y->left == NULL || y->left->is_black)) {

					//cout << "In the else->1st_if block of the leftchildcase" << endl;
					if (y->right != NULL)
						y->right->is_black = true;
					y->is_black = false;
					RotateLeft(y);
					y = xparent->left;
				}
				if (y != NULL)
					y->is_black = xparent->is_black;
				xparent->is_black = true;
				if (y != NULL && y->left != NULL)
					y->left->is_black = true;
				RotateRight(xparent);
				x = root;
			}
		}
	}
	if (x != NULL)
		x->is_black = true;

}

// Calculates the height of the tree
// Requires a traversal of the tree, O(n)
template <typename T>
int RBTree<T>::ComputeHeight(Node<T>* node) const {
	if (node == NULL)
		return 0;

	else {
		int leftHeight = ComputeHeight(node->left);
		int rightHeight = ComputeHeight(node->right);

		if (leftHeight > rightHeight)
			return (1 + leftHeight);
		else
			return (1 + rightHeight);

	}
}

// default constructor
template <typename T>
RBTree<T>::RBTree() {
	root = NULL;
	size = 0;
}

// copy constructor, performs deep copy of parameter
template <typename T>
RBTree<T>::RBTree(const RBTree<T>& rbtree) {

	root = CopyTree(rbtree.root, NULL);
	size = rbtree.Size();
	

}

// destructor
// Must deallocate memory associated with all nodes in tree
template <typename T>
RBTree<T>::~RBTree() {
	RemoveAll(root);
	size = 0;
}

// overloaded assignment operator
template <typename T>
RBTree<T>& RBTree<T>::operator=(const RBTree<T>& rbtree) {

	if (this != &rbtree) {
		RemoveAll(root);
		root = CopyTree(rbtree.root, NULL);
		size = rbtree.Size();
	}

	return *this;

}

// Accessor functions

// Calls BSTInsert and then performs any necessary tree fixing.
// If item already exists, do not insert and return false.
// Otherwise, insert, increment size, and return true.
template <typename T>
bool RBTree<T>::Insert(T item) {
	

	if (Find(item) != NULL) //check to see if the item already exists

		return false;      //return false if it already exists to prevent duplicates

	else {

		Node<T>* itemNode = BSTInsert(item); // get the pointer to the inserted node
		Node<T>* uncleNode = NULL;

		//as long as the inserted node pointer does not point to root and the color of this node's parent is not red
		while (itemNode != root && itemNode->p->is_black == false) {
			//if the inserted node's parent is the left child 
			if (itemNode->p == itemNode->p->p->left) {

				//define the uncle node
				uncleNode = itemNode->p->p->right;

				//if uncle node is red (and from the while loop condition inserted node's parent is also red)
				if (uncleNode != NULL && uncleNode->is_black == false) {
					//set inserted node's parent to black
					itemNode->p->is_black = true;
					//set the inserted node's uncle to black
					uncleNode->is_black = true;
					//set the inserted node's grandparent to red
					itemNode->p->p->is_black = false;
					//make the inserted node pointer point to the grandparent
					itemNode = itemNode->p->p;
				}
				//else uncle node is black i.e it is either null or has value with is_black = true
				else {
					//if the inserted node is the righ child of it's parent
					if (itemNode == itemNode->p->right) {
						//set inserted node's pointer to its parent
						itemNode = itemNode->p;
						//rotate left about this parent
						RotateLeft(itemNode);
					}
					//colour the inserted node's/itemNode black 
					itemNode->p->is_black = true;
					//colour the inserted node's grandparent red
					itemNode->p->p->is_black = false;
					//rotate right about the grandparent node
					RotateRight(itemNode->p->p);
				}
			}
			else {
				//symetric case

				//if the inserted node's parent is the right child 
				if (itemNode->p == itemNode->p->p->right) {

					//define the uncle node
					uncleNode = itemNode->p->p->left;

					//if uncle node is red (and from the while loop condition inserted node's parent is also red)
					if (uncleNode != NULL && uncleNode->is_black == false) {
						//set inserted node's parent to black
						itemNode->p->is_black = true;
						//set the inserted node's uncle to black
						uncleNode->is_black = true;
						//set the inserted node's grandparent to red
						itemNode->p->p->is_black = false;
						//make the inserted node pointer point to the grandparent
						itemNode = itemNode->p->p;
					}
					//else uncle node is black i.e it is either null or has value with is_black = true
					else {
						//if the inserted node is the left child of it's parent
						if (itemNode == itemNode->p->left) {
							//set inserted node's pointer to its parent
							itemNode = itemNode->p;
							//rotate right about this parent
							RotateRight(itemNode);
						}
						//colour the inserted node's/itemNode black 
						itemNode->p->is_black = true;
						//colour the inserted node's grandparent red
						itemNode->p->p->is_black = false;
						//rotate left about the grandparent node
						RotateLeft(itemNode->p->p);
					}

				}

			}
		}
		root->is_black = true;
		++size;
		return true;
	}
}

// Removal of an item from the tree.
// Must deallocate deleted node after RBDeleteFixUp returns
template <typename T>
bool RBTree<T>::Remove(T item) {

	//get the pointer to the node containing the item to be removed
	Node<T>* z = Find(item);
	Node<T>* x;
	Node<T>* y;
	bool is_xleftchild;

	//check to see if the item exists in the tree
	if (z != NULL) {

		//check whether the node to be removed has atmost one child
		if (z->left == NULL || z->right == NULL)
			y = z;
		//else it has 2 children. Therefore find it's predecessor
		else
			y = Predecessor(z);
		//check whether the node y (could be node to be removed or predecessor of this node)
		//has a left child
		if (y->left != NULL) 
			x = y->left;
			
		//otherwise the either y has a right child or no child
		else {
			x = y->right;
		}
		

		//check to see if node to be removed has no children
		if (x != NULL)
			//set y node's (can be the one with the item to be removed or a predecessor ) 
			//parent to node's child
			x->p = y->p;

		if (y->p == NULL) {
			root = x;
			is_xleftchild = true;
		}
			
		else {
			if (y == y->p->left) {

				y->p->left = x;
				is_xleftchild = true;
			}
				
			else {
				y->p->right = x;
				is_xleftchild = false;
			}
				
		}
		if (y != z)
			z->data = y->data;
		if (y->is_black ) {
			if (x == NULL) {
				cout << "x is null" << endl;
				RBRemoveFixUp(x, y->p, is_xleftchild);
			}
				
			else
				RBRemoveFixUp(x, x->p, is_xleftchild);
		}
		delete y;
		--size;
		return true;
	}
	
	return false;

}

// deletes all nodes in the tree. Calls recursive helper function.
template <typename T>
void RBTree<T>::RemoveAll() {
	RemoveAll(root);
	root = NULL;
	size = 0;
}

// returns the number of items in the tree
template <typename T>
int RBTree<T>::Size() const {

	return size;
}

// returns the height of the tree, from root to deepest null child. Calls recursive helper function.
// Note that an empty tree should have a height of 0, and a tree with only one node will have a height of 1.
template <typename T>
int RBTree<T>::Height() const {
	return ComputeHeight(root);
}



#endif