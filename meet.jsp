<%@page import="java.sql.PreparedStatement"%>
<%@page import="support.mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String staffname=session.getAttribute("uname").toString();
    String meetingdat=request.getParameter("dat");
    String sub=request.getParameter("sub");
    try
    {
        Connection con=DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select id from staff where uname='"+staffname+"'");
        if(rs.next())
        {
            int sid=rs.getInt(1);
            Statement st1=con.createStatement();
            ResultSet rs1=st1.executeQuery("select * from prokter where sid="+sid+" ");
            while(rs1.next())
            {
                int stid=rs1.getInt("studid");
                Statement st2=con.createStatement();
                ResultSet rs2=st2.executeQuery("select * from stud where id="+stid+" ");
                if(rs2.next())
                {
                    String stname=rs2.getString("uname");
                    String semail=rs2.getString("email");
                    PreparedStatement pstm=con.prepareStatement("insert into meeting(sname,stdname,dat,sub) values(?,?,?,?) ");
                    pstm.setString(1, staffname);
                    pstm.setString(2, stname);
                    pstm.setString(3, meetingdat);
                    pstm.setString(4,sub);
                    int x=pstm.executeUpdate();
                    
                    String Msg="Dear "+stname+" Your Meeting is scheduled with Mr. "+staffname+" at "+meetingdat+" Regarding"+sub;
                    mail m=new mail();
                    m.mailsend(Msg,"Meeting Schedule", semail);
                    
                }
            }
        }
        response.sendRedirect("planmeeting.jsp?msg=success");
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>
