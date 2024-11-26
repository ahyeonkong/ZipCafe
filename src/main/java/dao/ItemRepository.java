package dao;

import java.util.ArrayList;
import dto.Item;

public class ItemRepository{
	
	private ArrayList<Item> listOfItems = new ArrayList<Item>();
	
	private static ItemRepository instance = new ItemRepository();
	public static ItemRepository getInstance(){
		return instance;
	}
	
	public ItemRepository() {
	
		Item Item1= new Item("BN001","에티오피아 예가체프", 27000);
		Item1.setDescription("에티오피아 예가체프입니다.에티오피아 예가체프입니다.에티오피아 예가체프입니다.");
		Item1.setCategory("원두");
		Item1.setUnitsInStock(1000);		
		
		Item Item2 = new Item("HT002","페퍼민트", 30000);
		Item2.setDescription("페퍼민트입니다.페퍼민트입니다.페퍼민트입니다.");
		Item2.setCategory("허브차");
		Item2.setUnitsInStock(1000);		
		
		Item Item3= new Item("CP003","유리컵", 30000);
		Item3.setDescription("유리컵입니다.유리컵입니다.유리컵입니다.");
		Item3.setCategory("컵");
		Item3.setUnitsInStock(1000);		
		
		listOfItems.add(Item1);
		listOfItems.add(Item2);
		listOfItems.add(Item3);
				
	}
	public ArrayList<Item> getAllItems() {
		return listOfItems;
	}

	public Item getItemById(String ItemId) {
		Item ItemById = null;

		for (int i = 0; i < listOfItems.size(); i++) {
			Item Item = listOfItems.get(i);
			if (Item != null && Item.getItemId() != null && Item.getItemId().equals(ItemId)) {
				
				ItemById = Item;
				break;
			}
		}
		return ItemById;
	}
	
	public void addItem(Item Item) {
		listOfItems.add(Item);
	}
}
