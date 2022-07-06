<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String sname=session.getAttribute("uname").toString();
    String pname=request.getParameter("pname");
    String abst=request.getParameter("abst");
    try
    {
        Connection con=db.DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from projectabstract where sname='"+sname+"'");
        if(rs.next())
        {
            response.sendRedirect("prodiary.jsp?msg1=already filled this details");
        }
        else
        {
            PreparedStatement pstm=con.prepareStatement("insert into projectabstract(sname,abst,pname) values(?,?,?)");
            pstm.setString(1, sname);
            pstm.setString(2, abst);
            pstm.setString(3,pname);
            int x=pstm.executeUpdate();
            if(x>0)
            {
                response.sendRedirect("prodiary.jsp?ms=abstract_added");
            }
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
    
%>