<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html >
<head>    
    <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
	<title>Welcome</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>
    
	<%!String greeting = "Zip Cafe";%>
	
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><%=greeting%></h1>
        <p class="col-md-8 fs-4">Home Cafe Shopping Mall</p>
        <img src="./resources/images/cafe-banner.jpg" class="img-fluid" alt="HomeCafe Main Image" 
             style="max-width: 100%; height: auto;">
      </div>
    </div>
	
	<%@ include file="footer.jsp"%>
   
  </div>
</body>
</html>
  