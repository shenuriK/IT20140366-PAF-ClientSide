<%@page import="model.Feedback"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Management</title>


<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Rubik&display=swap" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css\footer.css">

<link rel="stylesheet" type="text/css" href="css\style.css">
<link rel="stylesheet" type="text/css" href="css\navbar.css">

<script src="components/jquery-3.6.0.js"></script>
<script src="components/feedback.js"></script>



 	
            
</head>


<body>

<nav class="navbar navbar-expand-md navbar-dark" style="background-color: 	#5353ff">
                   

     <ul class="navbar-nav">
         <li><a href="Index.jsp" class="nav-link">ElectroGrid</a></li>
     </ul>
                 
                 
     <div class="collapse navbar-collapse" id="navbarScroll">
          <ul class="navbar-nav m-auto my-2 my-lg-0">
	            <li class="nav-item">
	              <a class="nav-link" href="#">Home</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#">About Us</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#"> Customer Management </a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#"> Payment Management </a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#"> Bill Management </a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link active" href="#">Feedback Management</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#">Contact</a>
	            </li>
          </ul>
          
          <form class="d-flex">
            <input
              class="px-4 search"
              type="search"
              placeholder="Search"
              aria-label="Search"
            />
            <button class="btn0" type="submit">Search</button>
          </form>
          
      </div>
</nav> 
    
     <section id="learn" class="p-5 bg-dark text-light">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md p-5">
                    <h1>WE WANT YOYR <span class="text-warning"> FEEDBACK </span></h1>
                    <p class="lead">
                        Giving and receiving feedback is one of the most essential capabilities of a leader. 
                        In this podcast episode, you will learn a very simple set of rules that you can apply when 
                        giving and receiving feedback.
                    </p>
                    <p>How satisfied were you with the employees communication?</p>
                    
                    
                    <button class="btn btn-primary btn-lg">GIVE FEEDBACK</button>
                    
                </div>
                <div class="col-md">
                    <img src="./img/feedback.jpg" class="img-fluid" alt="" width="500" height="600">
                </div>
            </div>
        </div>

    </section>
    
           
        
<section class="bg-primary text-light p-5">
		<div class="container">
            <div class="d-md-flex justify-content-between align-items-center">
                <h3 class="mb-3 mb-md-0">Sign Up For Our Newsletter</h3>

                <div class="input-group news-input">
                    <input type="text" 
                           class="form-control" 
                           placeholder="Enter Email" >

                    <button class="btn btn-dark btn-lg" 
                            type="button" >
                            SUBMIT
                    </button>
                  </div>

            </div>
        </div>
</section>
        
    




<section style="background-color: AliceBlue;" class="contact">
      <div class="container">
        <div class="row py-5">
          <div class="col-lg-5 m-auto text-center">
            <h1>Give Your Feedback</h1>
            <h6 style="color: red;">Always Be In Touch With Us</h6>
          </div>
        </div>
      </div>
        

  

		<div class="container"> 
		<div class="row">  
		
            <div class="container col-md-10">
                <div class="card">
                    <div class="card-body">
                    <div class=" text-center">
            <div class="card border-0 bg-light mb-2">
              <div class="card-body">
                <img src="./img/stars.jpg" class="img-fluid" alt="">
              </div>
            </div>
                    
				<form id="formFeedback" name="formFeedback" method="post" action="Feedback.jsp">  
					Feedback:  
					<textarea name="" class="form-control bg-light" placeholder="Enter Your Message" id="" cols="10" rows="5"></textarea>  
					
					  
					 
					 <br>  
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
					 <input type="hidden" id="hidfeedbackIDSave" name="hidfeedbackIDSave" value=""> 
					 
					 
				</form> 
				  </div>
                </div>
            </div>
    
				<div id="alertSuccess" class="alert alert-success"></div>  
				<div id="alertError" class="alert alert-danger"></div> 
				
				<br>
					
				
            <div class="row">
               

                <div class="container">
                <br><br><br><br><br><br>
                    <h3 class="text-center" style="color: black;  font-size: 35px;font-weight: bold;">Feedback Details</h3>
                    
                    <div class="container text-center">

                        <a href="Index.jsp" class="btn btn-success"style="background-color: #5353ff">Navigate To Home page</a>
                        
                    </div>
                    <br>
                	<div class="container col-md-5">
	               <div class="card">
	               <div class="card-body">
                   <div style="color: black;font-size: 20px;text-align: center;" id="divItemsGrid">   
					<%    
						Feedback feedbackObj = new Feedback();
						out.print(feedbackObj.readFeedback());   
					%>  
				
					<br>
					</div>
					</div>
           			</div>
					<br>
					<div class="container text-center">
					 <a href="Login.jsp" class="btn btn-success"style="background-color: 	#5353ff">Logout</a>
				</div> 
				</div>
                   
                </div>
            </div>
				  
 			</div>
 		 
 		</div> 
 		</div>
 		<br><br><br><br> 
</section>
 	
 	<br><br>
 		
          <div class="col-lg-9 m-auto">
            <div class="row">
              <div class="col-lg-4">
                <h6>LOCATION</h6>
                <p>Malabe, Sri Lanka</p>
              
                <h6>PHONE</h6>
                <p>0777342687</p>
              
                <h6>EMAIL</h6>
                <p>rezwanjhon@gmail.com</p>
              
            </div>
            <div class="col-lg-7">
              <div class="row">
                <div class="col-lg-6">
                  <input type="text" class="form-control bg-light" placeholder="First Name">
                </div>
                <div class="col-lg-6">
                  <input type="text" class="form-control bg-light" placeholder="Last Name">
                </div>
              </div>
              <div class="row"> 
                <div class="col-lg-12 py-3">
                  <textarea name="" class="form-control bg-light" placeholder="Enter Your Message" id="" cols="10" rows="5"></textarea>
                </div>
              </div>
              <button class="btn0" type="submit">Submit</button>
            </div>
          </div> 
        </div>
        
 		
<br>
	 

</body>

 <!-- Site footer -->
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">Tharushika Devindi M.K.S.<i> </i>PAF Project</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Categories</h6>
            <ul class="footer-links">
              <li><a href="Payment.jsp">Bill Management</a></li>
              <li><a href="Customer.jsp">Feedback Management</a></li>
              <li><a href="Bill.jsp">Customer Management</a></li>
              <li><a href="Bill.jsp">Payment Management</a></li>
             
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Quick Links</h6>
            <ul class="footer-links">
              <li><a href="Index.jsp">HomePage</a></li>
              <li><a href="">Contact Us</a></li>
              <li><a href="">Contribute</a></li>
              <li><a href="">Privacy Policy</a></li>
              
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyright &copy; 2022 All Rights Reserved by 
         <a href="#">IT20140366</a>.
            </p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
                <span><a href="https://www.facebook.com/"><i class="ri-facebook-circle-fill"></i></a></span>
            	<span><a href="https://www.instagram.com/"><i class="ri-instagram-line"></i></a></span>
                <span><a href="https://twitter.com/"><i class="ri-twitter-fill"></i></a></span>
                <span><a href="https://www.google.com/"><i class="ri-google-fill"></i></a></span>    
            </ul>
          </div>
        </div>
      </div>
</footer>
</html>