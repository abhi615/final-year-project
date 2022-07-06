<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    String remark=request.getParameter("remark");
    String sname=session.getAttribute("stname").toString();
        try
    {
        Connection con=db.DbConnection.getConnection();
        PreparedStatement pstm=con.prepareStatement("update pprogress2 set remarks=? where id=?");
        pstm.setString(1, remark);
        pstm.setInt(2, id);
        int x=pstm.executeUpdate();
        if(x>0)
        {
            response.sendRedirect("viewdairyres.jsp?msg=added&sname="+sname);
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>