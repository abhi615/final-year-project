<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String sname=session.getAttribute("uname").toString();
    int id=Integer.parseInt(request.getParameter("id"));
    String res=request.getParameter("res");
    try
    {
        Connection con=db.DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select sres from meeting where id="+id+"");
        if(rs.next())
        {
            String rses=rs.getString(1);
            if(rses.equals("no"))
            {
                 PreparedStatement pstm=con.prepareStatement("update meeting set sres=? where id=?");
                 pstm.setString(1, res);
                 pstm.setInt(2, id);
                 int x=pstm.executeUpdate();
                 if(x>0)
                 {
                     response.sendRedirect("prokterdiary.jsp?ms=updatead");
                 }
                 
            }
            else
            {
            response.sendRedirect("prokterdiary.jsp?msg=Already_responded");
            }
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>
