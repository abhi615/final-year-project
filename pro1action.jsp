<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String sname=session.getAttribute("uname").toString();
    String sdate=request.getParameter("sdate");
    String edate=request.getParameter("edate");
    String progress=request.getParameter("progress");
    try
    {
        Connection con=db.DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from pprogress1 where sname='"+sname+"'");
        if(rs.next())
        {
            response.sendRedirect("studhome.jsp?msg1=already filled this details");
        }else
        {
            PreparedStatement pstm=con.prepareStatement("insert into pprogress1(sname,sdate,edate,progresss) values(?,?,?,?)");
            pstm.setString(1, sname);
            pstm.setString(2, sdate);
            pstm.setString(3, edate);
            pstm.setString(4,progress);
            int x=pstm.executeUpdate();
            if(x>0)
            {
                response.sendRedirect("studhome.jsp?ms=abstract_added");
            }
        }
    }catch(Exception e)
    {
        e.printStackTrace();
                
    }
%>