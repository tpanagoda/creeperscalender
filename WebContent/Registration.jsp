<%@ page import ="java.sql.*" %>
<%
    String email = request.getParameter("email");    
    String pwd = request.getParameter("pass");
    String name = request.getParameter("fname");
    String type = request.getParameter("pick");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://mysql100847-creeperscalendar.j.layershift.co.uk/jobschedulers",
            "root", "KPWncZFWyY");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into users(email, name,  password,type) values ('" + email + "','" + name + "','" + pwd + "','" + type + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("Employee.jsp");
    } else {
        response.sendRedirect("Employee.jsp");
    }
%>