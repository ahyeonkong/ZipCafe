<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
 <script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 등록</h1>
        <p class="col-md-8 fs-4">Item Addition</p>      
      </div>
    </div>
  
	 <div class="row align-items-md-stretch">
		<form name="newItem" action="./processAddItem.jsp" class="form-horizontal" method="post" 
		enctype ="multipart/form-data">			
			<div class="mb-3 row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" id="itemId" name="itemId" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="30자 이상 적어주세요"></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" >
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" id="filename" name="filename" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddItem()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</div>	
</body>
</html>
