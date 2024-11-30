<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
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
    <%@ include file="dbconn.jsp" %>
     <div class="row align-items-md-stretch   text-center">
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from item";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
	%>
			
     	<div class="col-md-4">
       		<div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("filename")%>" style="width: 250px; height: 200px; object-fit: cover;" />

				<p><h5><b><%=rs.getString("name")%></b></h5>
				<p> <%=rs.getString("description").substring(0,20)%>....
				<p><fmt:formatNumber value="<%=rs.getString(\"unitPrice\")%>" type="number"/>원</p>
				<p><a href="./item.jsp?id=<%=rs.getString("itemId")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>	
		</div>			
		<%
			}
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		%>
	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
