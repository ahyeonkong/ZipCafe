<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("shopping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("shopping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shoppingDate = new Cookie("shopping_shoppingDate", URLEncoder.encode(request.getParameter("shoppingDate"), "utf-8"));
	Cookie country = new Cookie("shopping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("shopping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("shopping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

	cartId.setMaxAge(365 * 24 * 60 * 60);
	name.setMaxAge(365 * 24 * 60 * 60);
	zipCode.setMaxAge(365 * 24 * 60 * 60);
	country.setMaxAge(365 * 24 * 60 * 60);
	addressName.setMaxAge(365 * 24 * 60 * 60);

	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shoppingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);

	response.sendRedirect("orderConfirmation.jsp");
%>
