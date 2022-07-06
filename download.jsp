<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    int bookId=Integer.parseInt(request.getParameter("id"));
    ServletOutputStream sos;
        Connection  con=null;
        PreparedStatement pstmt=null;
         
        response.setContentType("application/pdf");
 
        response.setHeader("Content-disposition","inline; filename="+bookId+".pdf" );
 
 
         sos = response.getOutputStream();
         
 
           try {
               Class.forName("com.mysql.jdbc.Driver");
               con = db.DbConnection.getConnection();
          } catch (Exception e) {
                     System.out.println(e);
                     System.exit(0); 
                          }
            
          ResultSet rset=null;
            try {
                pstmt = con.prepareStatement("Select pic from studpupload where id=?");
                pstmt.setInt(1, bookId);
                rset = pstmt.executeQuery();
                if (rset.next())
                    sos.write(rset.getBytes("pic"));
                else
                    return;
                 
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
     
        sos.flush();
        sos.close();
%>