<%@page import="support.mail"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    int staffid=Integer.parseInt(request.getParameter("sname"));
    String stdid[]=request.getParameterValues("stid");
    try
    {
        Connection con=db.DbConnection.getConnection();
        for(int i=0;i<stdid.length;i++)
        {
        PreparedStatement pstm=con.prepareStatement("insert into prokter(sid,studid) values(?,?)");
        pstm.setInt(1, staffid);
        pstm.setInt(2, Integer.parseInt(stdid[i]));
        int x=pstm.executeUpdate();
        }
        Statement stm=con.createStatement();
        ResultSet rsm=stm.executeQuery("select * from staff where id="+staffid+"");
        if(rsm.next())
        {
            String staffemail=rsm.getString("email");
            String sname=rsm.getString("sname");        
        Statement stm1=con.createStatement();
        for(int j=0;j<stdid.length;j++)
        {
        ResultSet rsm1=stm1.executeQuery("select * from stud where id="+Integer.parseInt(stdid[j])+"");
        if(rsm1.next())
        {
            String studemail=rsm1.getString("email");
            String stdname=rsm1.getString("sname");
            String Msg="Dear "+stdname+" Your prokter is assigned You have to report to your Prokter:"+sname;
            mail m=new mail();
            m.mailsend(Msg, "Prokter Assigned", studemail);
            String Msg1="Dear "+sname+" Your Students Assigned Name is :"+stdname;
            mail m1=new mail();
            m1.mailsend(Msg1, "Student Assigned", staffemail);
            
        }
        
        }
        }
       
        
        response.sendRedirect("addproctor.jsp?msg=added_success");
    }catch(Exception e)
    {
        e.printStackTrace();
    }
    
%>