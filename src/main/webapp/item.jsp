<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Item"%>

<%@ page import="dao.ItemRepository"%>

<jsp:useBean id="ItemDAO" class="dao.ItemRepository" scope="session" />

<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품 정보</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 정보</h1>
        <p class="col-md-8 fs-4">ItemInfo</p>      
      </div>
    </div>
	
	<%
	    String id = request.getParameter("id");
	    ItemRepository dao = ItemRepository.getInstance();
	    Item item = dao.getItemById(id);
	    
	    if (item == null) {
	        response.sendRedirect("items.jsp");
	        return;
	    }
	%>
	 <div class="row align-items-md-stretch">
 		<div class="col-md-5">
			<img src="./resources/images/<%=item.getFilename()%>" style="width: 70%">
		</div>
		<div class="col-md-12">
			<h3><b><%=item.getName()%></b></h3>
			<p><%=item.getDescription()%>
			<p><b>상품코드 : </b><span class="badge text-bg-danger"> <%=item.getItemId()%></span>										
			<p><b>분류</b> : <%=item.getCategory()%>
			<p><b>재고수</b> : <%=item.getUnitsInStock()%>
			<h4><%=item.getUnitPrice()%>원</h4>
			<p><a href="#" class="btn btn-info"> 상품 주문 &raquo;</a> 
				<a href="./items.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
		</div>
	</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
