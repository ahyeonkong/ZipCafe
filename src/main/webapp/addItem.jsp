<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
 <script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 등록</h1>
        <p class="col-md-8 fs-4">Item Addition</p>      
      </div>
    </div>
    
    
	<div class="row align-items-md-stretch">	 	
		<div class="text-end"> 
			<a href="?language=ko" >Korean</a> | <a href="?language=en" >English</a>
	</div>	
  
	 <div class="row align-items-md-stretch">
		<form name="newItem" action="./processAddItem.jsp" class="form-horizontal" method="post" 
		enctype ="multipart/form-data">			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="itemId" /></label>
				<div class="col-sm-3">
					<input type="text" id="itemId" name="itemId" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="name" /></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="unitPrice"  /></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2"
						class="form-control"></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" >
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="filename" /></label>
				<div class="col-sm-5">
					<input type="file" id="filename" name="filename" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddItem()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</div>	
</div>
</fmt:bundle>
</body>
</html>
