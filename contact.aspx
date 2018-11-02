<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "shopshare"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertContact @contactEmailTextBox,@contactComapnyTextBox,@contactPersonTextBox,@contactNumberTextBox,@ContactCommentTextBox", conn);
            comm.Parameters.Add("@contactEmailTextBox", System.Data.SqlDbType.NChar, 45);
            comm.Parameters["@contactEmailTextBox"].Value = contactEmail.Text;
            comm.Parameters.Add("@contactComapnyTextBox", System.Data.SqlDbType.NChar, 45);
            comm.Parameters["@contactComapnyTextBox"].Value = contactCompany.Text;
            comm.Parameters.Add("@contactPersonTextBox", System.Data.SqlDbType.NChar, 45);
            comm.Parameters["@contactPersonTextBox"].Value = contactPerson.Text;
            comm.Parameters.Add("@contactNumberTextBox", System.Data.SqlDbType.NChar, 20);
            comm.Parameters["@contactNumberTextBox"].Value = contactNumber.Text;
            comm.Parameters.Add("@contactCommentTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@contactCommentTextBox"].Value = contactComment.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico"> 
	
    <title>Shop Share Contact</title>

        <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- Custom styles for this template -->
    <link href="styles/shopStyles.css" rel="stylesheet">
	
</head>
<body>	
	<!-- Use the header area for the website name or logo -->
    <header>
      <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
          <div class="row">
            <div class="col-sm-8 col-md-7 py-4">
             <!-- nav for renters -->
            <ul>
             <li class="navHead">Available for Rent</li>
             <li><a href="shopRent.html" class="shopRentLink">Shop Space</a></li>
             <li><a href="toolRent.html" class="toolRentLink">Tools</a></li>
             <li><a href="setupRent.html" class="setupRentLink">Shop Package</a></li>
            </ul>

            </div>
            <div class="col-sm-4 offset-md-1 py-4">
              <!-- nav for owners -->
            <ul>
             <li class="navHead">Submit yours to Rent</li>
             <li><a href="shopSubmit.html" class="shopSubmitLink">Shop Space</a></li>
             <li><a href="toolSubmit.html" class="toolSubmitLink">Tools</a></li>
             <li><a href="setupSubmit.html" class="setupSubmitLink">Shop Package</a></li>
            </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="navbar navbar-dark bg-dark box-shadow">
        <div class="container d-flex justify-content-between">
          <a href="#" class="navbar-brand d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
            <strong>Listings</strong>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
      </div>
    </header>
	
		<!-- Use the main area to add the main content of the webpage -->
	<main>
	<form id="email_form" name="email_form" class="subform" runat="server"><!--- Start Form -->
	<p>Please send comments to <a href="mailto:rickmycwi@gmail.com">rickmycwi@gmail</a> or complete form below</p>
	
	  <p><label for="email_address1">Email Address:</label><br>
      <%--<input type="text" id="email_address1" name="email_address1"/>--%>
          <asp:TextBox ID="contactEmail" runat="server" /></p>
				
	  <p><label for="cName">Company:</label><br>
	  <%--<input type="text" name="cName" id="cName">--%>
          <asp:TextBox ID="contactCompany" runat="server" /></p>
	  
	  <p><label for="name">Person to contact:</label><br>
	  <%--<textarea id="name" name="name" rows="2" cols="21"></textarea></p>--%>
          <asp:TextBox ID="contactPerson" runat="server" /></p>
	  
	  <p><label for="phone">Phone Number:</label><br>
	  <%--<input type="tel" name="phone" id="phone">--%>
          <asp:TextBox ID="contactNumber" runat="server" /></p>
	  
      <p><label for="comments">Enter your comments:</label><br>
	  <%--<textarea id="comments" name="comments" rows="10" cols="45"></textarea>--%>
          <asp:TextBox ID="contactComment" runat="server" /></p>
          <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
<br />
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

	  
	  <%--<input type="submit" id="submit" value="Submit" class="btn" onclick="tyAlert()">--%>

	  <input type="reset" id="reset" value="Reset Form" class="btn">
	</form>
	<script>
	//Thank you alert
     function tyAlert() {
	alert("Thank you for your comments. I will contact you soon.");
    }
	</script>
	</main>

   <footer class="text-muted">
   <div class="container">
   <div id="social">
   <p>Connect:</p>
   <p><a href="https://www.twitter.com"><img src="images/twitter.PNG" alt="Twitter logo"></a>
   <a href="https://www.facebook.com"><img src="images/facebook.PNG" alt="Facebook logo"></a>
   <a href="https://www.linkedin.com"><img src="images/linkedin.PNG" alt="Linkedin logo"></a>
   <a href="https://github.com"><img src="images/github.PNG" alt="GitHub logo"></a></p>
   </div>
 
   <!-- nav for users -->
   <ul class="userNav">
   <li><a href="index.html" class="homeLink">home</a></li>
   <li><a href="about.html" class="aboutLink">about</a></li>
   <li><a href="contact.html" class="contactLink">contact</a></li>
   <li><a href="help.html" class="helpLink">help</a></li>
   </ul>
   <p class="float-right"></p>
 </div>
 
</footer>

</body>
</html>