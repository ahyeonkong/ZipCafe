<%@page import="dto.Item"%>
<%@page import="dao.ItemRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("items.jsp");
		return;
	}

	ItemRepository dao = ItemRepository.getInstance();

	Item item = dao.getItemById(id);
	if (item == null) {
		response.sendRedirect("exceptionNoItemId.jsp");
	}

	ArrayList<Item> goodsList = dao.getAllItems();
	Item goods = new Item();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getItemId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Item> list = (ArrayList<Item>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Item>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Item goodsQnt = new Item();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getItemId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("item.jsp?id=" + id);
%>