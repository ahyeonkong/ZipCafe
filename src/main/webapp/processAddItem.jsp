<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%@ page import = "java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	
	// 서버 배포 경로와 로컬 경로 설정
	String serverFolder = "C:\\Users\\KAH\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\HomeCafe\\resources\\images";
	String localFolder = "C:\\Users\\KAH\\eclipse-workspace\\HomeCafe\\src\\main\\webapp\\resources\\images";

	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	
	// 파일 업로드 전 기존 파일 확인 및 삭제
	String originalFileName = request.getParameter("filename");
	if (originalFileName != null) {
	    // 서버 폴더의 파일 삭제
	    File existingServerFile = new File(serverFolder + "\\" + originalFileName);
	    if (existingServerFile.exists()) {
	        existingServerFile.delete();
	    }
	    
	    // 로컬 폴더의 파일 삭제
	    File existingLocalFile = new File(localFolder + "\\" + originalFileName);
	    if (existingLocalFile.exists()) {
	        existingLocalFile.delete();
	    }
	}
	
	// MultipartRequest 설정 (서버 경로에 저장)
	MultipartRequest multi = new MultipartRequest(request, serverFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String itemId = multi.getParameter("itemId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");

	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	int stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Integer.valueOf(unitsInStock);
	
	// 파일 정보 가져오기
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	// 로컬 경로에도 파일 복사
	if (fileName != null) {
	    File serverFile = new File(serverFolder + "\\" + fileName);
	    File localFile = new File(localFolder + "\\" + fileName);
	    
	    FileInputStream fis = new FileInputStream(serverFile);
	    FileOutputStream fos = new FileOutputStream(localFile);
	    
	    byte[] buffer = new byte[1024];
	    int length;
	    while ((length = fis.read(buffer)) > 0) {
	        fos.write(buffer, 0, length);
	    }
	    
	    fis.close();
	    fos.close();
	}
	
	PreparedStatement pstmt = null;	
	
	String sql = "insert into item values(?,?,?,?,?,?,?)";
		
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, itemId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setLong(6, stock);
	pstmt.setString(7, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("items.jsp");

%>
