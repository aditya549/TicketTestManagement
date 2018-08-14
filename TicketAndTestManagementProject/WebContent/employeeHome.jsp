<!DOCTYPE html>
<%@page import="utily.Connections"%>
<%@page import="java.sql.*"%>
<%@page import="userbean.Registration"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>EMPLOYEE HOME</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  
  <style>
 img {
  border-radius: 50%;
}
#button1 {border-radius: 50px; 
background-color: black;
border: none;
    color: white;
    padding: 0px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    
    
    cursor: pointer;
}
.btn-default{
background-color: light;
}
* {
   margin: 0;
   padding: 0;
  }
  .imgbox {
   display: grid;
   height: 100%;
  }
  .center-fit {
   max-width: 100%;
   max-height: 100vh;
   margin: auto;
  }
  .imgbox {
    position: relative;
    text-align: center;
    color: black;
    background-color:white;
}
  .centered {
    position: absolute;
    top: 20%;
    left: 50%;
    transform: translate(-50%, -50%);
}
#z{
font-variant: small-caps;
font-style:Italic;

} 

p.small{
font-variant: small-caps;
font-size:25px;
}
h1{
padding-top:35px;
text-align:center;
text-transform: uppercase;
    color: #4CAF50;
    text-decoration-line: underline; 
}
h3{
padding-top:25px;
padding-left:50px;
text-decoration-line: underline;
font-size:20px;
}
h4{
padding-left:75px;
font-size:15px;
}

  </style>
  
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<%Registration u=(Registration)session.getAttribute("login"); %>
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <p class="small" style="color:red;">Ticket and Test Management</p>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="employeeHome.jsp">
            <i class="fa fa-home"></i>
            <span class="nav-link-text">Home</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="employeeEditProfile.jsp">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Edit Profile</span>
          </a>
        </li>
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-file"></i>
            <span class="nav-link-text">Tickets</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a href="employeeAddTicket.jsp">Add Ticket</a>
            </li>
            <li>
              <a href="empEditTicket.jsp">Edit Ticket</a>
            </li>
			<li>
              <a href="employeeViewTickets.jsp">View Tickets</a>
            </li>
          </ul>
        </li>
        <%if((u.getType().equals("quality analyst"))||(u.getType().equals("executive quality analyst"))) {%>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages" style="display:none">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-file"></i>
            <span class="nav-link-text">Test Management</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseExamplePages" >
            <li>
                                    <a href="#">Prepare Test Report</a>
                                </li>
                                <li>
                                    <a href="#">Prepare Test Data</a>
                                </li>
                                
                                <li>
                                    <a href="#">Prepare Bug Report</a>
                                </li>
                                <li>
                                    <a href="#"> View Ticket Report</a>
                                </li>
                                <li>
                                    <a href="#">Modify Ticket Report</a>
                                </li>
          </ul>
        </li>
        <%}else{ %>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages" >
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-file"></i>
            <span class="nav-link-text">Test Management</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseExamplePages" >
            <li>
                                    <a href="#">Prepare Test Report</a>
                                </li>
                                <li>
                                    <a href="#">Prepare Test Data</a>
                                </li>
                                
                                <li>
                                    <a href="#">Prepare Bug Report</a>
                                </li>
                                <li>
                                    <a href="#"> View Ticket Report</a>
                                </li>
                                <li>
                                    <a href="#">Modify Ticket Report</a>
                                </li>
          </ul>
        </li>
        <%} %>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="notifications.jsp">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Notifications</span>
          </a>
        </li>
      </ul>
      
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
      
             <li class="">
		<div class="container">
    <div class="dropdown">
    <%try {
    	Connection con=Connections.getUrl();
        PreparedStatement ps = con.prepareStatement("select * from registration where username=?");
        ps.setString(1,u.getUsername());
        ResultSet rs = ps.executeQuery();
       
        while ( rs.next()) { %>
                <button id="button1"  type="button" data-toggle="dropdown"><img width='50' height='50' src=displayphoto?id=<%=rs.getString("username")%> alt="avatar" style="width: 50px">
                  </button><font id="z" color=red size=5px><%=u.getName() %></font>
                  <ul class="dropdown-menu">
            <center><li><a href="login.jsp"><button class="btn btn-info">Log Out</button></a></li></center>
            
        </ul>
        
        <% }

        con.close();
    }
    catch(Exception ex) {
ex.printStackTrace();
    } %> 
        </div></div>                 
		</li> 
	
		
		
      </ul>
      
    </div>
  </nav>
  <div class="content-wrapper">
   <div class="container-fluid" >
      <!-- Breadcrumbs-->
     <h3> </h3>
<b><h3 style="color:red">Ticket Management :</h3></b>
<blockquote><h4>
Ticket Management provides a ticketing system to manage and maintain lists of issues and time to resolution.
</h4></blockquote><h1></h1>
<b><h3 style="color:red">Test Management :</h3></b>
<blockquote><h4>
Test Management helps you to maintain test reports and bug reports prepared by Testers.
</h4></blockquote>
      
            
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
  </div>
</body>

</html>
