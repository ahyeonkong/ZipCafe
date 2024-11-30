<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage = "exceptionNoProductId.jsp"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>

</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 정보</h1>
        <p class="col-md-8 fs-4">itemInfo</p>      
      </div>
    </div>
	
	  <%@ include file="dbconn.jsp" %>
	   <%
		String itemId = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from item where itemId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, itemId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>		
	 <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("filename")%>" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=rs.getString("name")%></b></h3>
				<p><%=rs.getString("description")%>
				<p><b>상품코드 : </b><span class="badge text-bg-danger"> <%=rs.getString("itemId")%></span>										
				<p><b>분류</b> : <%=rs.getString("category")%>
				<p><b>재고수</b> : <%=rs.getString("unitsInStock")%>
				<h4><fmt:formatNumber value="<%=rs.getString(\"unitPrice\")%>" type="number"/>원</h4>
				<p><form name="addForm" action="./addCart.jsp?itemId=<%=rs.getString("itemId")%>" method="post"><a href="#" class="btn btn-info" onclick="addToCart()"> 상품주문 &raquo;</a> 
				    <a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
					<a href="./items.jsp" class="btn btn-secondary"> 상품목록 &raquo;</a>
				</form>
			</div>
		</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>	
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
