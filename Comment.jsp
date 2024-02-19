
<%@page import="com.sentence.based.AbstractDao"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.model.CommentText"%>
<%@page import="com.dao.model.Product"%>
<%@page import="com.dao.model.User"%>
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
    <title>Dual_Sentiment_Analysis | Change Password</title>

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
    function addComment()
    {	
        var comment=document.getElementById("comment").value;
        alert(comment);
        if(comment!==""){
    	    document.getElementById("addCommentForm").submit();
        }
    }
    </script>
</head>

<body>
    <div id="wrapper">
       <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                  <strong>    <a class="navbar-brand" href="Home.jsp" style="color:#ffffff"> Sentiment Analysis </a></strong>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li><a href="UserHome.jsp" style="color:#ffffff" ><i class="fa fa-home"></i> Home <b class="caret"></b></a></li>
                <li><a href="ListEntre.jsp" style="color:#ffffff"><i class="fa fa-list"></i> Entrepreneurs <b class="caret"></b></a></li>
                <li><a href="ListCategory.jsp" style="color:#ffffff"><i class="fa fa-list"></i> Domains <b class="caret"></b></a></li>
                <li><a href="ListProducts.jsp" style="color:#ffffff"><i class="fa fa-shopping-cart"></i> Startups <b class="caret"></b></a></li>    <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:#ffffff"><i class="fa fa-gear"></i> Settings <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="width: 200px;">
                
                    	<li>
                            <a href="#" style="color:#8B441E"><b>Welcome : </b><%=user.getName() %> </a>
                        </li>
                        <li>
                            <a href="Profile.jsp" style="color:#8B441E"><i class="fa fa-fw fa-user"></i> Profile </a>
                        </li>
                        <li>
                            <a href="ChangePassword.jsp" style="color:#8B441E"><i class="fa fa-fw fa-key"></i> Change Password</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="UserLogin.jsp" style="color:#8B441E"><i class="fa fa-fw fa-sign-out"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
               <ul class="nav navbar-nav side-nav">
                <li>
                <img src="homeassets/images/c5.png" alt="Product 1" width="200" height="150">
                </li>
                    <li class="">
                        <a href="UserHome.jsp" style="color:#ffffff"><i class="fa fa-fw fa-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="ListEntre.jsp" style="color:#ffffff"><i class="fa fa-fw fa-list"></i>Entrepreneurs</a>
                    </li>
                    <li>
                        <a href="CurrentAffair.html" style="color:#ffffff"><i class="fa fa-fw fa-shopping-cart"></i>Current Affairs</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        
        <div id="page-wrapper">

           <div class="container-fluid" style="background-image :url('images/hbg5.jpg')">

                <!-- Page Heading 
                <div class="row">
                	<div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <h1 class="page-header">
                            Comment : <small> Dual_Sentiment_Analysis </small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                <div class="col-lg-1 col-md-12"></div>
                    <div class="col-lg-10 col-md-12">
                        <section class="hero">
			<h1>Enjoy Entrepreneurship !</h1>
			<p>Find everything you need for your business.</p>
		
		</section>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-12">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
  		                        <div class="row">
  		                        <div class="col-sm-1"></div>
  		                        <div class="col-sm-10">
               						<div class="row">
                                  		<% 
                                        	AbstractDao abstractDao=new AbstractDao(); 
                                  			long id= Long.parseLong(request.getParameter("productId").toString());
                                        	Product pc=(Product)abstractDao.getById("id",id, Product.class);                                        
                                       		%>
                            		<div class="col-md-12">            
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                          <h3><b>  <%=pc.getProductName()  %></b></h3>
                                        </div>
                                        <div class="panel-body" style="display: flex; justify-content: center; align-items: center;">
                                             <img src="Uploads/<%=pc.getProductPath() %>"  alt="Cinque Terre" width="250" height="300">
                                                     <hr><p style="padding-left:10px">
                                          <b>  Product : </b><%=pc.getProductName()  %>
                                            <br>
                                           <b> Category : </b><%=pc.getProductCategory().getCategory() %>
                                            <br>
                                          <b>  Price  : </b>&#8377; <%=pc.getProductPrice() %>
                                            <br>
                                          <b>  Color  : </b><%=pc.getColor() %>
                                            <br>
                                          <b>  Weight  :</b> <%=pc.getWeight() %>
                                         	<br>
                                          <b>  Features  : </b><%=pc.getFeatures() %></p>
                                        </div>
                                        <div class="panel-footer clearfix">
                                            <div class="row">
	                                            <div >
	                                            <div class="col-sm-1"></div>
										    	<div class="col-sm-10">
	                                            	 ______________________________________ FeedBacks ______________________________________
	                                            	 <hr>
	                                            	 <%List<CommentText> comments = pc.getComments(); 
	                                            	 	for(CommentText coText:comments){
	                                            	 %>
	                                            	 <div>
	                                            	 	<img src="images/User_Circle.png" width="50" height="50" alt="Image">&nbsp;&nbsp;&nbsp;&nbsp;<b><%=coText.getUser().getName() %></b><br>
	                                            	 	<%if(coText.getCommentText().split("---").length==1){ %>
	                                            	 	Comment : 
	                                            	 	<%=coText.getCommentText() %><br>
	                                            	 	<%}else{ %>
	                                            	 	Comment : 
	                                            	 	<%=coText.getCommentText().split("---")[0] %><br>
	                                            	 	----------------------------------------<br>
	                                            	 	Sentence Orientation Change : 
	                                            	 	<%=coText.getCommentText().split("---")[1] %><br>
	                                            	 	----------------------------------------<br>
	                                            	 	<%} %>	
	                                            	 		
	                                            	 	Opinions : <%=coText.getOpinion() %><br>
	                                            	 	Targets : <%=coText.getTargets() %><br>
	                                            	 	Sentiment : <%=coText.getSentiment() %><br>
	                                            	 	Score : <%=coText.getScore() %><br>
	                                            	 	<%-- Date : <%=coText.getDate() %><br>
	                                            	 	 --%>
	                                            	 </div>
	                                            	 <hr>
	                                            	 <%
	                                            	 	} %>
	                                            </div>
	                                            </div>
	                                        </div>
	                                        <hr>
                                            <div class="row" id="commentBox">
	                                            <div  >
	                                             <form id="addCommentForm" class="form-horizontal" role="form" action="rest/UserService/comment" method="post">
													<div class="form-group">
														<div class="col-sm-1"></div>
										    			<div class="col-sm-10">
										    				<input type="hidden" name="userId" value="<%=user.getUserid() %>">
										    				<input type="hidden" name="productId" value="<%=id %>">
										     				<textarea class="form-control" id="comment" name="comment" placeholder="Comments"></textarea>
										     				<br>
										     				<a class="btn btn-primary" href="javascript:addComment()"> Post </a>
										    			</div>
										  			</div>
													</form>
	                                            </div>
	                                         </div>
                                        </div>
                                    </div>
                            	</div>
                                  
                                  </div>  
                            <div class="clear">
                            </div>
								</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
	
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
</body>

</html>
