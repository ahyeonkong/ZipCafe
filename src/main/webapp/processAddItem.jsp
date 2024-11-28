<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="dto.Item"%>
<%@ page import="dao.ItemRepository"%>

<%
    request.setCharacterEncoding("UTF-8");

	//톰캣 배포 경로
	String uploadPath = request.getServletContext().getRealPath("/resources/images");
	// 프로젝트 실제 경로
	String projectPath = "C:\\IntelligentWebWorkspace\\HomeCafe\\src\\main\\webapp\\resources\\images";
    
    // 두 경로의 디렉토리 생성
    File uploadDir = new File(uploadPath);
    File projectDir = new File(projectPath);
    
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }
    if (!projectDir.exists()) {
        projectDir.mkdirs();
    }
    
    int maxSize = 5 * 1024 * 1024;
    String encoding = "utf-8";
    
    MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, encoding, new DefaultFileRenamePolicy());

    String itemId = multi.getParameter("itemId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");

    Integer price = unitPrice.isEmpty() ? 0 : Integer.valueOf(unitPrice);
    long stock = unitsInStock.isEmpty() ? 0 : Long.valueOf(unitsInStock);

    // 파일 업로드 처리
    String fileName = "";
    Enumeration files = multi.getFileNames();
    if (files.hasMoreElements()) {
        String fname = (String) files.nextElement();
        fileName = multi.getFilesystemName(fname);
    }
	// 프로젝트 경로로 파일 복사
    if (fileName != null && !fileName.isEmpty()) {
        File uploadedFile = new File(uploadPath + "/" + fileName);
        File projectFile = new File(projectPath + "/" + fileName);
        
        FileInputStream fis = new FileInputStream(uploadedFile);
        FileOutputStream fos = new FileOutputStream(projectFile);
        
        byte[] buffer = new byte[1024];
        int length;
        while ((length = fis.read(buffer)) > 0) {
            fos.write(buffer, 0, length);
        }
        
        fis.close();
        fos.close();
    }

    ItemRepository dao = ItemRepository.getInstance();

    Item newItem = new Item();
    newItem.setItemId(itemId);
    newItem.setName(name);
    newItem.setUnitPrice(price);
    newItem.setDescription(description);
    newItem.setCategory(category);
    newItem.setUnitsInStock(stock);
    newItem.setFilename(fileName);

    dao.addItem(newItem);

    response.sendRedirect("items.jsp");
%>