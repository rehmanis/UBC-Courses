
#ifdef _LINKEDLIST_H_

//#include "linkedlist.h"

#include <stdexcept>
using namespace std;


// helper function for deep copy
// Used by copy constructor and operator=
template <typename T>
void LinkedList<T>::CopyList(const LinkedList<T>& ll) {
	//DeleteList();
	if (ll.Size()==0) {
		return;
	}

	Node<T>* tempCopyll = front;

	for (Node<T>* templl = ll.front; templl != NULL; templl = templl->next) {
		if (front == NULL) {
			front = back = new Node<T>(templl->data);
			tempCopyll = front;
		}
		else {
			tempCopyll->next = new Node<T>(templl->data);
			tempCopyll->next->prev = tempCopyll;
			tempCopyll = tempCopyll->next;
			back = tempCopyll;
		}
	
	}
	size = ll.Size();
	
}
// helper function for deep delete
// Used by destructor and copy/assignment
template <typename T>
void LinkedList<T>::DeleteList() {

	//return;

	if (!IsEmpty()) {

		Node<T>* temp = front ;

		while (front->next != NULL) {

			front = front->next;
			delete temp;
			front->prev = NULL;
			temp = front;
		}
		front = NULL;
		back = NULL;
		size = 0;
		delete temp;

	}

}


// default constructor
template <typename T>
LinkedList<T>::LinkedList() {

	size = 0;
	front = NULL;
	back = NULL;

}
// copy constructor, performs deep copy of list elements
template <typename T>
LinkedList<T>::LinkedList(const LinkedList<T>& ll) {

	size = 0;
	front = NULL;
	back = NULL;
	CopyList(ll);

}

// destructor
template <typename T>
LinkedList<T>::~LinkedList() {
	DeleteList();
}

// MUTATORS

// Inserts an item at the front of the list
// POST:  List contains item at position 0
// PARAM: item = item to be inserted
template <typename T>
void LinkedList<T>::InsertFront(T item) {

	Node<T>* newNode = new Node<T>(item);

	if (IsEmpty()) {
		front = newNode;
		back = newNode;
		newNode->next = NULL;
		newNode->prev = NULL;
	}
	else {
		newNode->next = front;
		front->prev = newNode;
		newNode->prev = NULL;
		front = newNode;
	}
	++size;
}

// Inserts an item at the back of the list
// POST:  List contains item at back
// PARAM: item = item to be inserted
template <typename T>
void LinkedList<T>::InsertBack(T item) {

	Node<T>* newNode = new Node<T>(item);

	if (IsEmpty()) {
		back = newNode;
		front = newNode;
		//newNode->next = NULL;
		//newNode->prev = NULL;
	}
	else {
		newNode->prev = back;
		back->next = newNode;
		//newNode->prev = NULL;
		back = newNode;
	}
	++size;
	
}

// Inserts an item in position p (0-indexed)
// Throws exception for invalid index
// PRE:   0 <= p <= size
// POST:  List contains item at position p
// PARAM: item = item to be inserted, p = position where item will be inserted
template <typename T>
void LinkedList<T>::InsertAt(T item, int p) {
	if (p > size || p < 0) {
		throw invalid_argument("LinkedList<T>::RemoveAt - Index out of bounds");
	}
	else if (IsEmpty()) {
		Node<T>* newNode = new Node<T>(item);
		back = newNode;
		front = newNode;
		++size;
	}
	else if (p == 0) {
		InsertFront(item);
	}
	else if (p == size) {
		InsertBack(item);
	}
	else {
		Node<T>* curr = front;
		Node<T>* newNode = new Node<T>(item);

		for (int i = 0; i < p; i++) {
			curr = curr->next;
		}

		newNode->prev = curr->prev;
		curr->prev->next = newNode;
		newNode->next = curr;
		curr->prev = newNode;
		++size;
	}

}

// Removes and returns an item from position p (0-indexed)
// Throws exception if list is empty or index invalid
// PRE:   0 <= p < size
// POST:  Item is removed from list
// PARAM: p = position from where item will be removed
template <typename T>
T LinkedList<T>::RemoveAt(int p) {
	if (p >= size || p < 0) {
		throw invalid_argument("LinkedList<T>::RemoveAt - Index out of bounds");
	}

	//trying to remove from empty list	
	else if (IsEmpty()) {
		throw logic_error("LinkedList<T>::RemoveAt - empty list");
	}

	//remove at the front
	else if (p == 0) {

		T dataVal = front->data;
		Node<T>* curr = front;
		front = front->next;
		front->prev = NULL;	
		--size;
		//case when there was only one element in the list and we remove from the front
		if (size == 0)
			back = NULL;

		delete curr;
		return dataVal;
	}

	//remove from the back
	else if (p == size - 1) {
		T dataVal = back->data;
		Node<T>* curr = back;
		back = back->prev;
		back->next = NULL;
		--size;
		//case when there was only one element in the list and we remove from the back
		if (size == 0)
			front = NULL;

		delete curr;
		return dataVal;
	}

	else 
	{
		Node<T>* curr = front;

		for (int i = 0; i < p; i++) {
			curr = curr->next;
		}
		curr->prev->next = curr->next;
		curr->next->prev = curr->prev;

		T item = curr->data;
		delete curr;

		--size;
		return item;
	}

}

// Appends the contents of the parameter list to the back of this list as a deep copy
// PRE:
// POST: List contains every element of ll appended to back, size is updated appropriately
template <typename T>
void LinkedList<T>::Append(const LinkedList<T>& ll) {

	Node<T>* tempCopyll = back;
	//int appendSize = ll.Size()

	for (Node<T>* templl = ll.front; templl != NULL; templl = templl->next) {
		if (front == NULL) {
			front = back = new Node<T>(templl->data);
			tempCopyll = back;
		}
		else {
			tempCopyll->next = new Node<T>(templl->data);
			tempCopyll->next->prev = tempCopyll;
			tempCopyll = tempCopyll->next;
			back = tempCopyll;
		}

	}
	size = size + ll.Size();

}

// Removes duplicates from the list, preserving existing order of remaining items.
// The LAST occurrence of any duplicate (relative to the front of the list)
//   is the one which remains.
// Efficiency will not be a priority as long as the behaviour above is satisfied.
// PRE:   
// POST:  List contains no duplicates, front and back point to the appropriate nodes
// PARAM: 
template <typename T>
void LinkedList<T>::RemoveDuplicates() {


	Node<T>* n1 = back;
	Node<T>* n2 ;
	T dupVal;

	for (int i = size-1; i > 1; i--) {

		if (n1 == NULL)
			break;

		n2 = n1->prev;
		dupVal = n1->data;

		for (int j = i-1; j >=0 ; j--) {
			if (n2 != NULL) {
	
				if (n2->data == dupVal) {

					//n2->prev->next = n2->next;
					//n2->next->prev = n2->prev;
					//Node*<T> temp = n2;
					n2 = n2->prev;
					dupVal = RemoveAt(j);

					//delete temp;
				}
				else
					n2 = n2->prev;

			}
			else
				break;
		}
		n1 = n1->prev;

	}

}

// ACCESSORS

// Returns size of list
template <typename T>
int LinkedList<T>::Size() const {

	return size;
}

// Returns whether the list is empty
template <typename T>
bool LinkedList<T>::IsEmpty() const {

	if (size == 0)
		return true;
	else
		return false;
}

// Returns existence of item
template <typename T>
bool LinkedList<T>::Contains(T item) const {

	for (Node<T>* curr = front; curr != NULL; curr = curr->next) {
		if (curr->data == item) {
			return true;
		}
	}

	return false;
}

// Returns item at index (0-indexed)
// Throws exception for invalid index

template <typename T>
T LinkedList<T>::ElementAt(int p) const {

	if (p >= size || p < 0) {
		throw invalid_argument("LinkedList<T>::ElementAt - Index out of bounds");
	}

	else if (size == 0) {
		throw logic_error("LinkedList<T>::ElementAt - Empty list");
	}
	else {
		Node<T>* curr = front;

		for (int i = 0; i < p; i++) {
			curr = curr->next;
		}

		T item = curr->data;
		//delete curr;

		return item;
	}
}



// OVERLOADED OPERATORS

// overloaded assignment operator
// must work in the following cases:
// list2 = list1 -> general case
// list2 = list2 -> should do nothing

template <typename T>
LinkedList<T>& LinkedList<T>::operator=(const LinkedList<T>& ll) {

	if (this != &ll) {
		DeleteList();
		CopyList(ll);
	}

	return *this;
}

#endif
