<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String piguide=request.getParameter("giname");
    String sname=session.getAttribute("uname").toString();
    String pimono=request.getParameter("gimono");
    String pxguide=request.getParameter("gename");
    String pxmono=request.getParameter("gemono");
    String pplace=request.getParameter("pplace");
    String ppmono=request.getParameter("ppmono");
    String pcname=request.getParameter("pcname");
    String pcmono=request.getParameter("pcmono");
    String hodname=request.getParameter("hodname");
    String hodmono=request.getParameter("hodmono");
    try
    {
        Connection con=db.DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from projectcom where sname='"+sname+"'");
        if(rs.next())
        {
            response.sendRedirect("prodiary.jsp?msg=already filled this details");
        }
        else
        {
            PreparedStatement pstm=con.prepareStatement("insert into projectcom(sname,piname,pimono,pxname,pxmono,pplace,ppmono,pcname,pcmono,hodname,hodmono) values(?,?,?,?,?,?,?,?,?,?,?)");
            pstm.setString(1, sname);
            pstm.setString(2, piguide);
            pstm.setString(3, pimono);
            pstm.setString(4, pxguide);
            pstm.setString(5, pxmono);
            pstm.setString(6, pplace);
            pstm.setString(7, ppmono);
            pstm.setString(8, pcname);
            pstm.setString(9, pcmono);
            pstm.setString(10, hodname);
            pstm.setString(11, hodmono);
           int x=pstm.executeUpdate();
           if(x>0)
           {
               response.sendRedirect("proabstractaddpage.jsp?msg=success");
           }
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>
