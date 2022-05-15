<%@ page import="model.Bill" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Management</title>


<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Rubik&display=swap" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"> 

<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css\footer.css"> 

<link rel="stylesheet" type="text/css" href="css\style.css"> 
<link rel="stylesheet" type="text/css" href="css\navbar.css">

<script src="components/jquery-3.6.0.js"></script>
<script src="components/bill.js"></script>

<style>
.background {
    background-image: url("./img/ED.jpg");
}
.bg {
     background-color: AliceBlue;
}

</style>

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
              <a class="nav-link active" href="#"> Bill Management </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Feedback Management</a>
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


<br>
<br>


<div class="text-center">
         <h1>Web-based electricity billing management system</h1>
         <br>
         <h4 style="color: red;">Introduction</h4>
         <br>
         <p>ElectroGrid is a simple and user-friendly electricity billing and payment system designed to automate 
         payment of electricity bills by customers. Using the application, the management would fully eliminate 
         manual operations such as managing the number of units consumed, generating electricity bills and processing 
         customer payments.
         </p>
         <br><br><br>
</div>

        
        

<div class="background" class="container"> 
		<br><br>
        <div class="container col-md-5">
             <div class="card">
                  <div class="card-body">
                        <caption>
                            <h2>
                                Bill Management
                            </h2>
                        </caption>
		
			
						<form id="formBill" name="formBill" method="post" action="Bill.jsp">  
							Bill Amount:  
							<input id="billAmount" name="billAmount" type="text" class="form-control form-control-sm">  
							
							<br> 
							Bill Date:  
							<input id="billDate" name="billDate" type="text" class="form-control form-control-sm">  
							
							<br>
							 Paid Amount:  
							 <input id="paidAmount" name="paidAmount" type="text" class="form-control form-control-sm">  
							 
							 <br> 
							 Status:  
							 <input id="status" name="status" type="text" class="form-control form-control-sm">  
							 
							
							 <br>  
							 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
							 <input type="hidden" id="hidbillNoSave" name="hidbillNoSave" value=""> 
							 
							 
						</form> 
				  </div>
              </div>
              <br><br><br><br><br><br><br><br><br><br><br><br><br>
          </div>
    
		  <div id="alertSuccess" class="alert alert-success"></div>  
		  <div id="alertError" class="alert alert-danger"></div> 
				
				
					
		  <div class="bg" class="container" >
               <br><br><br><br>
               	
               <h3 style="color: black; text-align: center; font-size: 35px;font-weight: bold;">Bill Details</h3>
               <br><br>    
               <div class="container text-center">
					<a href="Index.jsp" class="btn btn-success" style=" background-color: #5353ff">Navigate To Home page</a>
               </div>
               <br>
               <div class="container col-md-5">
               <div class="card">
               <div class="card-body">
               <div style="color: black;font-size: 20px;" id="divItemsGrid">   
					<%    
						Bill billObj = new Bill();
						out.print(billObj.readBill());   
					%>  
				<br>
				</div>
           </div>
           </div>
           <br>
				<div class="container text-center">
					<a href="Login.jsp" class="btn btn-success" style="background-color: #5353ff">Logout</a>
				</div>
				</div> 
                 <br><br><br><br><br><br><br><br><br>  
           </div>
           
</div>    
 		
<br><br><br>


          <div class="text-center">
            <h1>Questions About Electricity Bills</h1>
            <h6 style="color: red;">ELECTRICITY GENERATION</h6>
            <br>
          </div>


<div class="row">
          <div class="col-lg-4 text-center">
            <img src="./img/bill.jpg" class="img-fluid mb-3" alt="">
            <h5>How can I reduce my electricity bill?</h5>
            <p>Use brighter bulbs or task lighting in areas where you do close-up work such as reading, cooking or similar work. 
            Use less-bright light in other areas. Optimum use of natural light! Be smart enough to get the optimum use of 
            natural light, it's so bright and it's free.</p>
          </div>
          
          <div class="col-lg-4 text-center">
            <img src="./img/meter.jpg" class="img-fluid mb-3" alt="">
            <h5>What cost the most on electric bill?</h5>
            <p>What costs the most on your electric bill? Heating and cooling are by far the greatest energy users in the home, 
            making up around 40% of your electric bill. Other big users are washers, dryers, ovens, and stoves. 
            Electronic devices like laptops and TVs are usually pretty cheap to run, but of course, it can all add up.
            </p>
          </div>
          
          <div class="col-lg-4 text-center">
            <img src="./img/elec.jpg" class="img-fluid mb-3" alt="">
            <h5>How much does it cost to leave a light on for 24 hours?</h5>
            <p>Let's say you have a 60-watt incandescent lightbulb and you are paying 12 cents per kWh of energy. 
            Leaving the bulb on the whole day will 
            therefore cost you: 0.06 (60 watts / 1000) kilowatts x 24 hours x 12 cents = approximately 20 cents in one day.
            </p>
          </div>
</div>
          

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
              <li><a href="Feedback.jsp">Feedback Management</a></li>
              <li><a href="Bill.jsp">Bill Management</a></li>
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

<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
</html>