<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <script type="text/javascript" src="js/attendance.js"></script>
    <title>Instructor Dashboard</title>

	
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	

    <!-- Bootstrap core CSS -->
    <c:url value="/css/bootstrap.min.css" var="cssBootstrap"/>
    <link href="${cssBootstrap}" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <c:url value="/css/dashboard.css" var="cssDashboard"/>
    <link href="${cssDashboard}" rel="stylesheet">
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">YMCA Swim</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <c:url value="/instructorViewClasses" var="instructorViewClassesLink"/>
            <li><a href="${instructorViewClassesLink}">View Classes</a></li>
           
          </ul>
          <ul class="nav nav-sidebar">
            <c:url value="http://www.ymca.net/" var="ymcaLink"/>
            <li><a href="${ymcaLink}">YMCA</a></li>
            <c:url value="http://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/water-safety/swim-safety" var="swimSafety"/>
            <li><a href="${swimSafety}">Swim Safety Tips</a></li>
            
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Instructor Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Place Holder</h4>
              <span class="text-muted">Place Holder information</span>
	
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Place Holder</h4>
              <span class="text-muted">Place Holder information</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Place Holder</h4>
              <span class="text-muted">Place Holder information</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Place Holder</h4>
              <span class="text-muted">Place Holder information</span>
            </div>
          </div>

          <h2 class="sub-header">My Classes</h2>
          <div class="table-responsive">
            <table class="table table-striped" id="attTable">
              <thead>
                <tr>
                  <th>Class Name</th>
                  <th>Age Group</th>
                  <th>Day of Week</th>
                  <th>Time</th>
                  <th>Start Date</th>
                  <th>End Date</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${allScheduledClasses}" var="classes">
                <tr data-level-name="${classes.levelName}" data-age-group="${classes.ageGroup}" data-student-name="${classes.studentName}" data-toggle="modal" data-target="#att-modal" >
                  <td><c:out value="${classes.levelName }" /></td>
                  <td><c:out value="${classes.ageGroup }" /></td>
                  <td><c:out value="${classes.dayOfWeek }" /></td>
                  <td><c:out value="${classes.hour }" /></td>
                  <td><c:out value="${classes.startDate }" /></td>
                  <td><c:out value="${classes.endDate }" /></td>
                  </tr>
                  </c:forEach>
               
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    
<!-- ATTENDANCE MODAL BELOW -->
<div id="att-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>Attendance</h2>
        <h3 class="modal-title">Modal title</h3>
        <h4 class="modal-sub-title">Modal subtitle</h4>
      </div>
      
      <div class="modal-body">
      <label for="selectInstructor">Select Instructor</label>
      <select name="assignedInstructor" class="form-control">
      <c:forEach var="instructor" items="${allInstructors}">
        <option value="${instructor.instructorId }"><c:out value="${instructor.firstName + ' ' + instructor.lastName}"/></option>
       	</c:forEach>
       	</select>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="dayOfWeek">Day Of Week</label>
      <select name="assignDayOfWeek" class="form-control">
		<option value="Sunday">Sunday</option>
       	<option value="Monday">Monday</option>
       	<option value="Tuesday">Tuesday</option>
       	<option value="Wednesday">Wednesday</option>
       	<option value="Thursday">Thursday</option>
       	<option value="Friday">Friday</option>
       	<option value="Saturday">Saturday</option>
       	</select>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="time">Class Time</label>
      	<input id="time" class="form-control"></input>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="startDate">Start Date</label>
      	<input id="time" class="form-control"></input>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="endDate">End Date</label>
      	<input id="time" class="form-control"></input>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="notes">Class Notes</label>
      	<textarea id="notes" class="form-control"></textarea>
  	  </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
