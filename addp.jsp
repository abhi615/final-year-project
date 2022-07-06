<%-- 
    Document   : addp
    Created on : May 19, 2022, 6:06:42 PM
    Author     : Dell
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
     String staffname=session.getAttribute("uname").toString();
    String pdat=request.getParameter("dat");
    String cname=request.getParameter("cname");
    String jt=request.getParameter("jt");
    double ec=Double.parseDouble(request.getParameter("ec"));
    try
    {
        Connection con=db.DbConnection.getConnection();
        PreparedStatement pstm=con.prepareStatement("insert into req(sname,cname,jt,ec,dat,pdat)values(?,?,?,?,?,now())");
        pstm.setString(1, staffname);
        pstm.setString(2, cname);
        pstm.setString(3, jt);
        pstm.setDouble(4, ec);
        pstm.setString(5, pdat);
        int x=pstm.executeUpdate();
        if(x>0)
        {
            response.sendRedirect("addplacement.jsp?msg=success");
        }else
        {
           response.sendRedirect("addplacement.jsp?msg1=Failed"); 
        }
        
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>
