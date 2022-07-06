<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    try
    {
        Connection con=db.DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from staff where id="+id+"");
        if(rs.next())
        {
            PreparedStatement pstm=con.prepareStatement("update staff set sts=? where id=? ");
            pstm.setString(1, "Yes");
            pstm.setInt(2, id);
            int x=pstm.executeUpdate();
            if(x>0)
            {
                response.sendRedirect("viewstaff.jsp?msg=activated");
            }else
            {
              response.sendRedirect("viewstaff.jsp?msg1=error");  
            }
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>