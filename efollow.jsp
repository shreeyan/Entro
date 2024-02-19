<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="com.servlets.*"%>
<%@page import="com.dao.model.*"%>
<%@page import="com.sentence.based.AbstractDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    	User user=null;
    	if(session.getAttribute("user")!=null)
    		user=(User)session.getAttribute("user");
    	else
    		response.sendRedirect("UserLogin.jsp");
    %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Entro | Change Password</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link href="css/MAin.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
    function changePassword()
    {
    	
    	var xmlhttp;
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        	xmlhttp=new XMLHttpRequest();
        }
        else
        {
        	// code for IE6, IE5
        	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
        	if(xmlhttp.readyState==4 && xmlhttp.status==200)
        	{
        		var jsonData = JSON.parse(xmlhttp.responseText);
            	if(jsonData.result==='success' && jsonData.status==='updated')
            	{	
            		document.getElementById("message").innerHTML="password Updated Successfully...........";
            	}
            	else
            	{	
            		document.getElementById("message").innerHTML=jsonData.status;
            	}
        	}
        } 
        
        var confirmPassword=document.getElementById("confirmPassword").value;
        var password=document.getElementById("password").value;
        if(confirmPassword===password){
    	    xmlhttp.open("POST","rest/UserService/changePassword",true);
    	    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	    xmlhttp.send("password="+password);
        }
        else{
        	
        	document.getElementById("message").innerHTML="Password Not Match";
        	
        }
    }
    </script>
</head>

<body>
    <div id="wrapper">
       <% if(user.getUserType().equals("admin")) {%>
 		<jsp:include page="AdminNavigation.jsp"></jsp:include>
     <%}else{ %>
     	<jsp:include page="UserNavigation.jsp"></jsp:include>
     	<%} %>
     	
     	
        <div id="page-wrapper">

            <div class="container-fluid" style="background-image :url('images/hbg5.jpg')">

                <!-- Page Heading 
                <div class="row">
                	<div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <h1 class="page-header">
                            View Profile <small> Dual_Sentiment_Analysis </small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> View Profile
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-3 col-md-12"></div>
                    <div class="col-lg-6 col-md-12">
                        <section class="hero" style="padding:50px">
			<h1>Hey <%=user.getName() %>!</h1>
			<p>following is added</p>
			
			
		</section>
 <section class="admission_section">
 
                                        	
     <table border="1" id="displaytable" class="table table-bordered" style="display.none" >
								          <thead>
								          <tr>
								          			
								        			   
								        			   
														
								          </tr>
                                          <%
                                          
                                          try
                                          {
                                          Class.forName("com.mysql.jdbc.Driver");
                                  		  Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dual_sentiment", "root", "root");
                                  		  String username = request.getRemoteUser();
                                  		  PreparedStatement pst=con.prepareStatement("insert into efollow(name,ename,job,loc,conn,summary) values(?,?,?,?,?,?)");
                            			  pst.setString(1,user.getName());
                            			  pst.setString(2,"Rajesh");
                            			  pst.setString(3,"Software developer");
                            			  pst.setString(4,"Nashik");
                            			  pst.setString(5,"145");
                            			  pst.setString(6,"A proud full-stack developer");
                            			  int row=pst.executeUpdate();
                                          if(row>0)
                                          {
                                          
                                          %>
                                          <tbody>
                                                   <tr>
                                                   
                                                   <td> FOLLOWER ADDED </td>
                                                
                                                                                                      </tr>
                                          </tbody>
                                                   <%
                                                   }
                                                   //connection.close();
                                                   } catch (Exception e) {
                                                   e.printStackTrace();
                                                   }
                                                   %>
								          
										</thead>
				 </table>  
    </section>

</body>
</html>