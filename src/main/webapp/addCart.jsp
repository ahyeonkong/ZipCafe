<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Item"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
    String itemId = request.getParameter("itemId");
    if (itemId == null || itemId.trim().equals("")) {
        response.sendRedirect("items.jsp");
        return;
    }

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Item goods = null;

    try {
        String sql = "SELECT * FROM item WHERE itemId = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, itemId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            goods = new Item();
            goods.setItemId(rs.getString("itemId"));
            goods.setName(rs.getString("name"));
            goods.setUnitPrice(rs.getInt("unitPrice"));
            goods.setDescription(rs.getString("description"));
            goods.setCategory(rs.getString("category"));
            goods.setUnitsInStock(rs.getInt("unitsInStock"));
            goods.setFilename(rs.getString("filename"));
        } else {
            response.sendRedirect("exceptionNoItemId.jsp");
            return;
        }

        ArrayList<Item> cartlist = (ArrayList<Item>) session.getAttribute("cartlist");
        if (cartlist == null) {
            cartlist = new ArrayList<Item>();
            session.setAttribute("cartlist", cartlist);
        }

        int cnt = 0;
        for (Item item : cartlist) {
            if (item.getItemId().equals(itemId)) {
                cnt++;
                item.setQuantity(item.getQuantity() + 1);
                break;
            }
        }

        if (cnt == 0) {
            goods.setQuantity(1);
            cartlist.add(goods);
        }

        response.sendRedirect("item.jsp?id=" + itemId);

    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>