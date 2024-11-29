<%@page import="dto.Item"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shopping_cartId = "";
	String shopping_name = "";
	String shopping_shoppingDate = "";
	String shopping_country = "";
	String shopping_zipCode = "";
	String shopping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("shopping_cartId"))
				shopping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shopping_name"))
				shopping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shopping_shoppingDate"))
				shopping_shoppingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shopping_country"))
				shopping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shopping_zipCode"))
				shopping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shopping_addressName"))
				shopping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>

<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주문 정보</h1>
        <p class="col-md-8 fs-4">Order Info</p>      
      </div>
    </div>
  	
  		<div class="row align-items-md-stretch alert alert-info">	 	
	
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shopping_name); %><br> 
				우편번호 : <% 	out.println(shopping_zipCode);%><br> 
				주소 : <%	out.println(shopping_addressName);%>(<%	out.println(shopping_country);%>)<br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>배송일: <% out.println(shopping_shoppingDate);	%></em>
			</div>
		</div>
		<div class=" py-5">
			<table class="table table-hover">			
			<tr>
				<th class="text-center">상품</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Item> cartList = (ArrayList<Item>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Item>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Item item = cartList.get(i);
					int total = (int)item.getUnitPrice() * item.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=item.getName()%> </em></td>
				<td class="text-center"><%=item.getQuantity()%></td>
				<td class="text-center"><%=item.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> </strong></td>
			</tr>
			</table>			
				<a href="./shoppingInfo.jsp?cartId=<%=shopping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			
		</div>
	</div>
	</div>		
</body>
</html>
