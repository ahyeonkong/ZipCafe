package dto;

import java.io.Serializable;

public class Item implements Serializable{
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String itemId; 		    //상품 ID
	private String name;		    //상품명
	private int unitPrice; 	    	//가격
	private String description; 	//설명
	private String category; 		//분류
	private long unitsInStock; 		//재고개수
	private String filename;		//이미지 파일명
	
	public Item() {
		super();
	}
	
	public Item(String itemId, String name, Integer unitPrice) {
		this.itemId = itemId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
