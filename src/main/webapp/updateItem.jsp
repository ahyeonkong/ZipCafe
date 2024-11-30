<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>상품 수정</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 수정</h1>
        <p class="col-md-8 fs-4">Item Updating</p>      
      </div>
    </div>
  <%@ include file="dbconn.jsp"%>
  <%
  		String itemId = request.getParameter("itemId");

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
				<img src="./resources/images/<%=rs.getString("filename")%>" alt="image" style="width: 100%" />
			</div>
		<div class="col-md-7">	
		<form name="newItem" action="./processUpdateItem.jsp" method="post" enctype="multipart/form-data">		
			<div class="mb-3 row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-5">
					<input type="hidden" name="itemId" value="<%=rs.getString("itemId")%>">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-5">
					<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("name")%>'>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-5">
					<input type="text" name="unitPrice"  id="unitPrice"class="form-control" value='<%=rs.getString("unitPrice")%>'>
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-8">
					<textarea  name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="30자 이상 적어주세요"><%=rs.getString("description")%></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-5">
					<input type="text" name="category" class="form-control" value='<%=rs.getString("category")%>'>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-5">
					<input type="text" name="unitsInStock" id="unitsInStock"class="form-control" value='<%=rs.getString("unitsInStock")%>'>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-8">
					<input type="file" name="filename" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록 " >
				</div>
			</div>
		</form>
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
</div>

</body>
</html>
