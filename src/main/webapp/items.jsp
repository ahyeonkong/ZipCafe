<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Item"%>

<%@ page import="dao.ItemRepository"%>

<jsp:useBean id="ItemDAO" class="dao.ItemRepository" scope="session" />
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

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
			Item item = listOfItems.get(i);
	  %>
     	<div class="col-md-4">
       		<div class="h-100 p-2">	
       			<img src="./resources/images/<%=item.getFilename()%>" style="width: 250; height:350" />	
				<h5><b><%=item.getName()%></b></h5>
					<br> <%=item.getUnitPrice()%>원
				<p> <%=item.getDescription().length() > 10 ? item.getDescription().substring(0,10) + "..." : item.getDescription()%>
				<p><%=item.getUnitPrice()%>원
				<p><a href="./item.jsp?id=<%=item.getItemId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
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
