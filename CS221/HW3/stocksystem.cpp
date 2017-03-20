// File:        stocksystem.cpp
// Author:      Shamsuddin Rehmani
// Date:        2016-06-05
// Description: Implementation of a StockSystem class for use with CPSC 221 assignment #3

#include "stocksystem.h"

// default constructor;
// begin with a balance of $100,000.00
StockSystem::StockSystem() {

	balance = 100000.00;
}

// returns the balance member
double StockSystem::GetBalance() {

	return balance;
}

// Add a new SKU to the system. Do not allow insertion of duplicate sku
bool StockSystem::StockNewItem(StockItem item) {

	if (item.GetPrice() < 0)
		return false;

	return records.Insert(item);
}

// Locate the item with key itemsku and update its description field.
// Return false if itemsku is not found.
bool StockSystem::EditStockItemDescription(int itemsku, string desc) {

	StockItem* item = new StockItem(itemsku, "", 0.0);
	if (records.Retrieve(*item) != NULL) {
		item = records.Retrieve(*item);
		item->SetDescription(desc);
		return true;
	}

	return false;
}

// Locate the item with key itemsku and update its retailprice.
// Return false if itemsku is not found or retailprice is negative.
bool StockSystem::EditStockItemPrice(int itemsku, double retailprice) {

	if (retailprice < 0)
		return false;

	StockItem* item = new StockItem(itemsku, "", 0.0);
	if (records.Retrieve(*item) != NULL) {
		item = records.Retrieve(*item);
		item->SetPrice(retailprice);
		return true;
	}

	return false;
}

// Purchase quantity of item at unitprice each, to reach a maximum (post-purchase) on-hand stock quantity of 1000.
// Return false if balance is not sufficient to make the purchase,
//   or if SKU does not exist, or if quantity or unitprice are negative.
// Otherwise, return true and increase the item's on-hand stock by quantity,
//   and reduce balance by quantity*unitprice.
bool StockSystem::Restock(int itemsku, int quantity, double unitprice) {
	StockItem* item = new StockItem(itemsku, "", 0.0);
	item = records.Retrieve(*item);
	int myStock;
	if (unitprice < 0 || quantity < 0 || item == NULL || quantity*unitprice > balance)
		return false;
	else {
		myStock = item->GetStock();

		if (myStock == 1000)
			return true;

		else if ((myStock + quantity) > 1000) {

			item->SetStock(1000);
			balance -= (1000-myStock)*unitprice;

		}
		else {
			balance -= quantity*unitprice;
			item->SetStock(quantity+myStock);
		}

		return true;
	}
}

// Sell an item to a customer, if quantity of stock is available and SKU exists.
// Reduce stock by quantity, increase balance by quantity*price, and return true if stock available.
// If partial stock (less than quantity) available, sell the available stock and return true.
// If no stock, sku does not exist, or quantity is negative, return false.
bool StockSystem::Sell(int itemsku, int quantity) {

	StockItem* item = new StockItem(itemsku, "", 0.0);
	item = records.Retrieve(*item);
	int myStock;

	if (item == NULL)
		return false;
	else {
		myStock = item->GetStock();

		if (quantity < 0 || myStock == 0)
			return false;

		else {

			if (quantity > myStock) {
				item->SetStock(0);
				balance += myStock * item->GetPrice();
			}
			

			else {
				item->SetStock(myStock - quantity);
				balance += quantity * item->GetPrice();
			}
				
			return true;
		}

	}

	
}
