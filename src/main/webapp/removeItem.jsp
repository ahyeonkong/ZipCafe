<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Item"%>
<%@ page import="dao.ItemRepository"%>
<%
	String itemId = request.getParameter("itemId");
	if (itemId == null || itemId.trim().equals("")) {
		response.sendRedirect("items.jsp");
		return;
	}

	ItemRepository dao = ItemRepository.getInstance();
	
	Item item = dao.getItemById(itemId);
	if (item == null) {
		response.sendRedirect("exceptionNoItemId.jsp");
	}

	ArrayList<Item> cartList = (ArrayList<Item>) session.getAttribute("cartlist");
	Item goodsQnt = new Item();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getItemId().equals(itemId)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
