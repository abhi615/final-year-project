<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String uname=request.getParameter("uname");
    String pass=request.getParameter("pass");
    try
    {
        Connection con=db.DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from stud where uname='"+uname+"' ");
        if(rs.next())
        {
            String p=rs.getString("pass");
            String email=rs.getString("email");
            session.setAttribute("set","1");
            if(p.equals(pass))
            {
                session.setAttribute("uname", uname);
                session.setAttribute("email", email);
                response.sendRedirect("studhome.jsp?msg=success");
            }else
            {
               response.sendRedirect("slogin.jsp?msg1=Invalid_password"); 
            }
        }else
        {
            response.sendRedirect("slogin.jsp?msg2=Invalid_username");
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
%>