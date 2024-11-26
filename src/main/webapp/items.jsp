<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Item"%>

<%@ page import="dao.ItemRepository"%>

<jsp:useBean id="ItemDAO" class="dao.ItemRepository" scope="session" />
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<title>상품 목록</title>
</head>
<body>
<div class="container py-4">	
   <%@ include file="menu.jsp"%>
   
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 목록</h1>
        <p class="col-md-8 fs-4">ItemList</p>      
      </div>
    </div>
	<%
		ItemRepository dao = ItemRepository.getInstance();
		ArrayList<Item> listOfItems = dao.getAllItems();
	%>   
	   
	 <div class="row align-items-md-stretch   text-center">	 	
	 <%
		for (int i = 0; i < listOfItems.size(); i++) {
			Item Item = listOfItems.get(i);
	  %>
     	<div class="col-md-4">
       		<div class="h-100 p-2">			
				<h5><b><%=Item.getName()%></b></h5>
					<br> <%=Item.getUnitPrice()%>원
				<p> <%=Item.getDescription().substring(0,10)%>...
				<p><%=Item.getUnitPrice()%>원
				<p><a href="./item.jsp?id=<%=Item.getItemId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>	
		</div>			
		<%
			}
		%>	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
