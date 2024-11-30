<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Item"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("items.jsp");
        return;
    }

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        String sql = "SELECT * FROM item WHERE itemId = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        if (!rs.next()) {
            response.sendRedirect("exceptionNoItemId.jsp");
            return;
        }

        ArrayList<Item> cartList = (ArrayList<Item>) session.getAttribute("cartlist");
        if (cartList != null) {
            for (int i = 0; i < cartList.size(); i++) {
                if (cartList.get(i).getItemId().equals(id)) {
                    cartList.remove(i);
                    break;
                }
            }
            session.setAttribute("cartlist", cartList);
        }

        response.sendRedirect("cart.jsp");

    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>