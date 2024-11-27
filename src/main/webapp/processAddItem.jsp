<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Item"%>
<%@ page import="dao.ItemRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String ItemId = request.getParameter("ItemId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");	
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	ItemRepository dao = ItemRepository.getInstance();			

	Item newItem = new Item();
	newItem.setItemId(ItemId);
	newItem.setName(name);
	newItem.setUnitPrice(price);
	newItem.setDescription(description);
	newItem.setCategory(category);
	newItem.setUnitsInStock(stock);

	dao.addItem(newItem);

	response.sendRedirect("items.jsp");

%>
