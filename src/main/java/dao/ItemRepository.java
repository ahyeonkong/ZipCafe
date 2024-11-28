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
	
		Item item1= new Item("BN001","에티오피아 예가체프", 27000);
		item1.setDescription("에티오피아 예가체프입니다.에티오피아 예가체프입니다.에티오피아 예가체프입니다.");
		item1.setCategory("원두");
		item1.setUnitsInStock(1000);		
		item1.setFilename("BN001.jpg");
		
		Item item2 = new Item("HT002","페퍼민트", 30000);
		item2.setDescription("페퍼민트입니다.페퍼민트입니다.페퍼민트입니다.");
		item2.setCategory("허브차");
		item2.setUnitsInStock(1000);		
		item2.setFilename("HT002.jpg");
		
		Item item3= new Item("CP003","유리컵", 30000);
		item3.setDescription("유리컵입니다.유리컵입니다.유리컵입니다.");
		item3.setCategory("컵");
		item3.setUnitsInStock(1000);	
		item3.setFilename("CP003.jpg");
		
		listOfItems.add(item1);
		listOfItems.add(item2);
		listOfItems.add(item3);
				
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
