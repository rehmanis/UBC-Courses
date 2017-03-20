// File:        a3simpledriver.cpp
// Author:      Shamsuddin Rehmani
// Date:        2016-06-14
// Description: Test driver for RBTree and StockSystem classes.
//		Some are tests are done using inspection of tree elements


#include <iostream>
#include <cstdlib>
#include <string>
#include <iomanip>	// provides std::setw()

#include "rbtree.h"
#include "stocksystem.h"

using namespace std;

// forward declarations

void PrintMenu();
void printTree(Node<int>* , int);
void RBTreeTest1();
void RBTreeTest2();
void RBTreeTest3();
void RBTreeTest4();

// program entry point
int main()
{
	cout << "Running RBTree test 1: default constructor, insert, size..." << endl;
	RBTreeTest1();
	cout << " done.\n" << endl;

	cout << "Running RBTree test 2: copy constructor..." << endl;
	RBTreeTest2();
	cout << " done.\n" << endl;

	cout << "Running RBTree test 3: insert and remove..." << endl;
	RBTreeTest3();
	cout << " done.\n" << endl;

	cout << "Running RBTree test 4: insert and remove..." << endl;
	RBTreeTest4();
	cout << " done.\n" << endl;
	
	//code from this point onwards was already provided
	int choice = 0;
	string inputchoice;
	int asku;
	string inputasku;
	string adesc;
	double aprice;
	string inputaprice;
	int amount;
	string inputamt;
	string ctlg = "";

	StockSystem mystore;

	while (choice != 8)
	{
		PrintMenu();
		// get the menu choice from standard input
		getline(cin, inputchoice);
		choice = atoi(inputchoice.c_str());

		switch (choice)
		{
		case 1: // Print balance
			cout << "Funds: $" << mystore.GetBalance() << endl << endl;
			break;
		case 2: // Print catalogue
			ctlg = mystore.GetCatalogue();
			cout << ctlg << endl;
			break;
		case 3: // Add SKU
			cout << "Enter a numeric SKU (will be converted to 5 digits): ";
			getline(cin, inputasku);
			asku = atoi(inputasku.c_str());
			cout << "Enter item description: ";
			getline(cin, adesc);
			cout << "Enter a retail price: $";
			getline(cin, inputaprice);
			aprice = atof(inputaprice.c_str());
			if (mystore.StockNewItem(StockItem(asku, adesc, aprice)))
				cout << "Successfully added item to catalogue." << endl;
			else
				cout << "Item not added to catalogue." << endl;
			break;
		case 4: // Edit item description
			cout << "Enter a numeric SKU to edit: ";
			getline(cin, inputasku);
			asku = atoi(inputasku.c_str());
			cout << "Enter item description: ";
			getline(cin, adesc);
			if (mystore.EditStockItemDescription(asku, adesc))
				cout << "Item successfully updated." << endl;
			else
				cout << "Item not updated." << endl;
			break;
		case 5: // Edit item price
			cout << "Enter a numeric SKU to edit: ";
			getline(cin, inputasku);
			asku = atoi(inputasku.c_str());
			cout << "Enter a retail price: $";
			getline(cin, inputaprice);
			aprice = atof(inputaprice.c_str());
			if (mystore.EditStockItemPrice(asku, aprice))
				cout << "Item successfully updated." << endl;
			else
				cout << "Item not updated." << endl;
			break;
		case 6: // Restock an item
			cout << "Enter a numeric SKU to purchase: ";
			getline(cin, inputasku);
			asku = atoi(inputasku.c_str());
			cout << "Enter a quantity to purchase: ";
			getline(cin, inputamt);
			amount = atoi(inputamt.c_str());
			cout << "Enter the per-unit purchase price: $";
			getline(cin, inputaprice);
			aprice = atof(inputaprice.c_str());
			if (mystore.Restock(asku, amount, aprice))
				cout << "Item successfully restocked." << endl;
			else
				cout << "Item not restocked." << endl;
			break;
		case 7: // Sell an item
			cout << "Enter the SKU of item to sell: ";
			getline(cin, inputasku);
			asku = atoi(inputasku.c_str());
			cout << "Enter a quantity to sell: ";
			getline(cin, inputamt);
			amount = atoi(inputamt.c_str());
			if (mystore.Sell(asku, amount))
				cout << "Transaction complete. Have a nice day." << endl;
			else
				cout << "Item is out of stock. Sorry!" << endl;
			break;
		case 8: // Quit
				// no need to do anything, will cause while loop to break
			break;
		default:
			cout << "Invalid choice." << endl;
			break;
		}
	}
	
	system("pause");

	return 0;
}

//function provided by the professor
void PrintMenu()
{
	cout << "****************************************************\n"
		<< "* Please select an option:                         *\n"
		<< "* 1. Print balance             6. Restock an item  *\n"
		<< "* 2. Print catalogue           7. Sell an item     *\n"
		<< "* 3. Add a new SKU                                 *\n"
		<< "* 4. Edit item description                         *\n"
		<< "* 5. Edit item price           8. Quit             *\n"
		<< "****************************************************\n" << endl;
	cout << "Enter your choice: ";
}

//takes a pointer to node r and prints the node and its children
// * is used to specify that the node is red
// and black otherwise.
void printTree(Node<int> * r, int d = 0) {
	if (r == NULL) return;
	printTree(r->right, d + 1);
	std::cout << std::setw(3 * d) << ""; // output 3 * d spaces
	if (r->is_black == false) {
		std::cout << r->data <<"*" << std::endl;
	}
	else
		std::cout << r->data <<std::endl;
	printTree(r->left, d + 1);
}



//test default constructor, insert, size;
void RBTreeTest1() {

	RBTree<int> tree1;

	//check the  defult constructor works
	if (tree1.Size() != 0 && tree1.Height() != 0) {
		cout << "tree incorrectly initialized" << endl;
	}

	//insert a item. This should be the root node and the color should be black
	try {
		bool status = tree1.Insert(15);
		if (tree1.Contains(15) == false || status == false){
			cout << "not inserted properly" << endl;
		}
		if (tree1.Size() != 1) {
			cout << "size not updated" << endl;
		}
		if (tree1.GetRoot()->is_black == false) {
			cout << "root has wrong color" << endl;
		}
	}
	catch (exception e) {
		cout << e.what() << endl;
	}

	// Try to insert a duplicate. Insert an item on the left of the root
	// Insert another item to the left of the new node. see if RB properties are maintained. 
	// Insert such that each conditional blocks are tested
	try {

		//insert 1st item which should be the root
		bool status = tree1.Insert(15);
		if (status == true) {
			cout << "added duplicate item which should not have been added" << endl;
		}
		//height of the tree with one node should be 1 since we are counting the null nodes as children
		if (tree1.Size() != 1 || tree1.Height() != 1) {
			cout << "size not updated" << endl;
		}
		//insert 2 item
		tree1.Insert(8);
		if (tree1.GetRoot()->left->is_black == true) {
			cout << "left child of root has wrong color" << endl;
		}

		//insert 3 item as the left child. Inserted node, parent and grandparent are all aligned. Parent is red
		//but uncle is null (i.e black) . Therefore, switch colors of parent and grandparent and perform right rotation
		//about grandparent. Height should now be 2 not 3.

		tree1.Insert(3);
		if (tree1.Height() != 2) {
			cout << "RB propertie violated" << endl;
		}
		if (tree1.GetRoot()->data != 8) {
			cout << "wrong root node" << endl;
		}

		//print the tree. Items with * indicates that the node is red colored
		//printTree(tree1.GetRoot());
		//cout << "-------------------------------------" << endl;

		//add a right child to the left subtree. Uncle and parent are red. Color parent and uncle black and grandparent red.
		//no rotation. Set grandparent to black since it is the root node
		tree1.Insert(6);

		//print the tree. Items with * indicates that the node is red colored
		//printTree(tree1.GetRoot());
		//cout << "-------------------------------------" << endl;

		//add a left child to the left subtree. No fixing takes places
		tree1.Insert(2);

		//print the tree. Items with * indicates that the node is red colored
		//printTree(tree1.GetRoot());
		//cout << "-------------------------------------" << endl;

		//insert a left child to the right subtree's right child to test the else block for the case where uncle and parent are red
		tree1.Insert(4);

		//print the tree. Items with * indicates that the node is red colored
		//printTree(tree1.GetRoot());
		//cout <<"-------------------------------------" <<endl;

		//insert a left child to the right subtree's right child to test the double rotation 
		//(first rightrotate and then left rotate)
		tree1.Insert(5);

		//print the tree. Items with * indicates that the node is red colored
		printTree(tree1.GetRoot());
		cout << "-------------------------------------" << endl;

		if (tree1.Height() != 4) {
			cout << "Incorrect Height" << endl;
		}

	}
	catch (exception e) {
		cout << e.what() << endl;
	}
	


}

//test copy constructor, RemoveAll
void RBTreeTest2() {


	//create tree with many elements
	RBTree<int> tree1;
	tree1.Insert(15);
	tree1.Insert(8);
	tree1.Insert(3);
	tree1.Insert(6);
	tree1.Insert(2);
	tree1.Insert(4);
	tree1.Insert(5);

	//test if tree with many elements gets copies
	RBTree<int> tree2(tree1);

	

	//print the tree. Items with * indicates that the node is red colored
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;
	printTree(tree2.GetRoot());
	cout << "-------------------------------------" << endl;

	//check if both tree1 and tree2 gets modified if an item is added to tree2
	tree2.Insert(11);
	printTree(tree2.GetRoot());
	cout << "-------------------------------------" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;


	//test if empty tree gets copied
	RBTree<int> tree3;
	RBTree<int> tree4(tree3);
	printTree(tree3.GetRoot());
	cout << "-------------------------------------" << endl;
	printTree(tree4.GetRoot());
	cout << "-------------------------------------" << endl;

	//test if tree with one element gets copied
	tree3.Insert(10);
	RBTree<int> tree5(tree3);
	printTree(tree3.GetRoot());
	cout << "-------------------------------------" << endl;
	printTree(tree5.GetRoot());
	cout << "-------------------------------------" << endl;

	//remove tree with many elements;
	tree1.RemoveAll();
	cout << "After removing tree, printTree looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;
	
	
}

// test insert, remove and equals operator
void RBTreeTest3() {

	//create tree with many elements
	RBTree<int> tree1;
	tree1.Insert(15);
	tree1.Insert(8);
	tree1.Insert(3);
	tree1.Insert(6);
	tree1.Insert(2);
	tree1.Insert(4);
	tree1.Insert(5);

	cout << "After inserting element in the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	// Case 1: remove a red leaf node that is a left child i.e no fixup required
	tree1.Remove(4);
	cout << "After removing 4 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//Case: 2: remove a red leaf node that is a right child i.e no fixup
	tree1.Remove(6);
	cout << "After removing 6 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//case 3: remove a black leaf node that is a left child. Fixup will be required 
	//but no rotation should take place
	tree1.Remove(2);
	cout << "After removing 2 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	

	//case 4: remove a black node with one right child. Fixup will be required
	tree1.Remove(3);
	cout << "After removing 3 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//insert two elements to left subtree;
	tree1.Insert(3);
	tree1.Insert(6);
	cout << "After inserting 3 and then 6 to the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//case 5: remove a black node with 2 children. Predecessor is red so no fixup required
	tree1.Remove(5);
	cout << "After removing 5 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//insert two elements to left subtree;
	tree1.Insert(1);
	tree1.Insert(4);
	cout << "After inserting 1 and then 2 to the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;



	//case 6: remvoe a red node with 2 children. Predecessor is black. Right child
	//of this red node has a left child. Therefore 2 rotations are required.
	tree1.Remove(3);
	cout << "After removing 3 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//case 7: delete root node which has two children left child red and right child
	//black
	tree1.Remove(8);
	cout << "After removing 8 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//case 8: delete root node which has two black children 
	//black
	tree1.Remove(6);
	cout << "After removing 6 from the tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//try removing an item that does not exist
	tree1.Remove(6);
	cout << "After trying to remove 6, which does not exist, the tree looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//try to remove from an empty tree;
	tree1.RemoveAll();
	tree1.Remove(6);
	cout << "After trying to remove 6 from empty tree, it looks like:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	tree1.Insert(15);
	tree1.Insert(8);
	tree1.Insert(3);
	tree1.Insert(6);
	tree1.Insert(20);
	tree1.Insert(14);
	tree1.Insert(13);
	tree1.Insert(12);
	tree1.Insert(22);
	tree1.Insert(18);

	cout << "new tree:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//do some removal for the rightchild case. 
	tree1.Remove(15);
	tree1.Remove(14);
	tree1.Remove(13);
	cout << "After several removal:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//test the equals operator
	RBTree<int> tree2;
	tree2 = tree1;
	tree2.Remove(18);
	cout << "tree2:" << endl;
	printTree(tree2.GetRoot());
	cout << "-------------------------------------" << endl;
	cout << "tree1:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//check if tree = tree causes problems
	tree1 = tree1;
	cout << "tree1:" << endl;
	printTree(tree1.GetRoot());
	cout << "-------------------------------------" << endl;

	//randomly inserting and removing elements from tree. Compare the answer with 
	//https://www.cs.usfca.edu/~galles/visualization/RedBlack.html

	tree1.RemoveAll();
	cout << "tree1:" << endl;
	printTree(tree1.GetRoot());
	cout << "size of tree 1 is: " << tree1.Size() << endl;
	cout << "height of tree 1 is: " << tree1.Height() << endl;
	cout << "-------------------------------------" << endl;
	tree1.Insert(100);
	tree1.Remove(20);
	tree1.Remove(100);
	tree1.Insert(1);
	tree1.Insert(11);
	tree1.Remove(11);
	tree1.Insert(13);
	tree1.Insert(12);
	tree1.Insert(11);
	tree1.Insert(33);
	tree1.Insert(120);
	tree1.Insert(111);
	tree1.Insert(105);
	tree1.Remove(100);
	cout << "tree1:" << endl;
	printTree(tree1.GetRoot());
	cout << "size of tree 1 is: " << tree1.Size() << endl;
	cout << "height of tree 1 is: " << tree1.Height() << endl;
	cout << "-------------------------------------" << endl;

	//few other random tests
	tree2 = tree1;
	tree1 = tree2;
	cout << "tree1:" << endl;
	printTree(tree1.GetRoot());
	cout << "size of tree 1 is: " << tree1.Size() << endl;
	cout << "height of tree 1 is: " << tree1.Height() << endl;
	cout << "-------------------------------------" << endl;

	cout << "tree2:" << endl;
	printTree(tree2.GetRoot());
	cout << "size of tree 2 is: " << tree2.Size() << endl;
	cout << "height of tree 2 is: " << tree2.Height() << endl;
	cout << "-------------------------------------" << endl;

	if (tree1.Remove(999))
		cout << "removing 999 from tree was sucessful" << endl;
	else
		cout << "999 was not found in the tree" << endl;

	tree1.RemoveAll();
	printTree(tree1.GetRoot());
	cout << "size of tree 1 is: " << tree1.Size() << endl;
	cout << "height of tree 1 is: " << tree1.Height() << endl;
	cout << "-------------------------------------" << endl;

	cout << "tree2:" << endl;
	printTree(tree2.GetRoot());
	cout << "size of tree 2 is: " << tree2.Size() << endl;
	cout << "height of tree 2 is: " << tree2.Height() << endl;
	cout << "-------------------------------------" << endl;

}

//This test case was provided by the professor
void RBTreeTest4()
{


	RBTree<int> tree1;

	tree1.Insert(1);
	tree1.Insert(3);
	tree1.Insert(2); // should cause 2 rotations to occur
	tree1.Insert(4);
	tree1.Remove(4);

	cout << "Tree contains " << tree1.Size() << " entries." << endl;
	cout << "Tree height: " << tree1.Height() << endl;

	RBTree<int> tree2(tree1);

	tree1.RemoveAll();

	RBTree<int> tree3;
	tree3.Insert(5);
	tree3 = tree2;
}