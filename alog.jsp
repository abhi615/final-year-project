<%
    String uname=request.getParameter("uname");
    String pass=request.getParameter("pass");
    if(uname.equals("admin"))
    {
        if(pass.equals("eswar"))
        {
            session.setAttribute("uname", uname);
            response.sendRedirect("ahome.jsp?msg=success");
        }else
        {
            response.sendRedirect("admin.jsp?msg=Incorrect_password");
        }
    }else
    {
       response.sendRedirect("admin.jsp?msg1=Incorrect_Username"); 
    }
%>