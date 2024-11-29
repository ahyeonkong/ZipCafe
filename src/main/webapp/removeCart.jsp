<%@page import="dao.ItemRepository"%>
<%@page import="dto.Item"%>
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

	ArrayList<Item> cartList = (ArrayList<Item>) session.getAttribute("cartlist");
	Item goodsQnt = new Item();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getItemId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
