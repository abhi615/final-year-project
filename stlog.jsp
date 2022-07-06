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
        ResultSet rs=st.executeQuery("select * from staff where uname='"+uname+"' ");
        if(rs.next())
        {
            String p=rs.getString("pass");
            String sts=rs.getString("sts");
            
            if(p.equals(pass))
            {
                if(sts.equals("Yes"))
                {
                session.setAttribute("uname", uname);
                //session.getAttribute("email")
                
                response.sendRedirect("staffhome.jsp?msg=success");
                }else
                {
                    response.sendRedirect("stlogin.jsp?msg3=Account_not_Activated");
                }
            }else
            {
               response.sendRedirect("stlogin.jsp?msg1=Invalid_password"); 
            }
        }else
        {
            response.sendRedirect("stlogin.jsp?msg2=Invalid_username");
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
%>