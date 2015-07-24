<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
	
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <title>Job Scheduler in Java</title>
	<link rel="stylesheet" type="text/css" href="./codebase/demo.css" />
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
 
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
              <a class="navbar-brand" href="index.html"><span class="bold"><s:property escape="false" value="username" /></span></a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> <div class="username">
					Welcome, <span class="bold"><s:property escape="false" value="username" /></span>!
				</div> <div class="logout">
					[ <a href="logout.action" class="btn btn-danger square-btn-adjust">Log off</a> ]
				</div></a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse" >
           
                <ul class="nav" id="main-menu" style=" height:1250px; background-image:url(assets/img/bar_pic.png); background-repeat:no-repeat;background-size: 250px 1200px;opacity: 0.9; background-color:inherit;">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
				
					
                     <li>
                        <a class='<s:property escape="false"  value="messageStore.sample_dsc" />'   href="index.action"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a class='<s:property escape="false" value="messageStore.minical" />'    href="04_recurring.action"><i class="fa fa-desktop fa-3x"></i> Recurring View</a>
                    </li>
                    <li>
                        <a class='<s:property escape="false" value="messageStore.name3" />'  href="06_map.action"><i class="fa fa-qrcode fa-3x"></i> Map View</a>
                    </li>
						  
                      <li  >
                        <a  href="Employee.jsp"><i class="fa fa-bar-chart-o fa-3x"></i>Employee</a>
                    </li>
                    		
                    <li>
                        <a  class="active-menu" href="AboutUs.jsp"><i class="fa fa-qrcode fa-3x"></i> Help</a>
                    </li>
						 
					                   
                    
                        
                 	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2 class="text-primary">About Us        </h2>   
                        <h5> Thanks  for staying with us  </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 
                                 
            <div class="row">
                <div class="col-md-8 col-sm-8">
                  <div class="panel panel-default">
                        <div class="panel-heading">
                           <h3>Event Calender</h3>
                        </div>
                    <div class="panel-body">
                            <p> Creepers Event Calender is web based software  which helps to managing and oraganizing  the Bussiness evnets and  non Bussiness events in organization.Creeppers Event Calender focaus on the  small teams in the oraganization.It helps to time easeir time allocation amonng the members of the teams.</p>
                      </div>
                    </div>
                </div>
                </div>
                
                                 
          
                
                
           
                    <!-- /. ROW  -->
           
                    <!-- /. ROW  -->
            <div class="row">
                

                            
                < <div class="col-md-8 col-sm-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          <h3 class="h3">Basic Operations</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills">
                                <li class=""><a href="#home-pills" data-toggle="tab">Dashbord</a>
                                </li>
                                <li class=""><a href="#profile-pills" data-toggle="tab">Recurring Event</a>
                                </li>
                                <li class=""><a href="#messages-pills" data-toggle="tab">Map Event</a>
                                </li>
                                <li class=""><a href="#employee-pills" data-toggle="tab">Employee Registration</a>
                                </li>
                                 <li class=""><a href="#about-pills" data-toggle="tab">About us </a>
                                </li>
                            </ul>
   <div class="tab-content">
                                <div class="tab-pane fade" id="home-pills">
                                    <h4>Dashbord</h4>
                                    <p>In the dashboard user can view employees, mini calendar and event calendar .Manager can add events to the employee or employees in their team or organization. Employee can see what the events that Manager assigned to them. Then Employee can organize his work. Mini calendar is use to see the date and Event Calendar can be use to add events, update events and Delete events from the Calendar.</p>
                                </div>
                                <div class="tab-pane fade" id="profile-pills">
                                    <h4>Recurring Event</h4>
                                    <p>In the Recurring Event tab User can view Mini Calendar, Event Calendar and Employee list. In this page user can add, update and delete event   in Event Calendar. The main point is this page user can add “Recurring” in to their events.   Recurring event means continues events in the team   and user can view their own recurring event in the employee searching tab.</p>
                                </div>
                                <div class="tab-pane fade" id="messages-pills">
                                    <h4>Map Event</h4>
                                    <p> In Map event tab user can add particular place to their events.  There is 6 major parts of the system
Which are called Agenda, Grid, Map, Day, Week and Month .When user create the Event user can sort their view by six major parts. System provide map to the user and user can click on the   map and system get the direction automatically and show in the grid.
</p>
                                </div>
                                <div class="tab-pane fade active in" id="employee-pills">
                                    <h4>Employee Registration</h4>
                                    <p> In the Employee Registration system provide the Registration from to the User. This link is show according to the user privilege. Only Super user can access to the system. After filling the date in to   the System  and save the data and provide login  user credential  to the other users.  </p>
                                </div>
                                 <div class="tab-pane fade active in" id="about-pills">
                                    <h4>About us</h4>
                                    <p>General idea about the System and functions. Team members name and other details</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-4 col-sm-4">
                 
                         <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          Team Members
                        </div>
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">Tharindu Ishan panagoda </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse" style="height: 0px;">
                                        <div class="panel-body">
                                         UCD-NO:13208212
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">M.G Malinga Siriwardana</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse in" style="height: auto;">
                                        <div class="panel-body">
                                         UCD-NO:13208275
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed">K.M Himal Bandara</a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            UCD-NO:13208215
                                        </div>
                                    </div>
                                </div>
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed">Sithum Wanniarachchi</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse in" style="height: auto;">
                                        <div class="panel-body">
                                         UCD-NO:13208275
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
               
                
                    <!-- /. ROW  -->
          
            
                    <!-- /. ROW  -->

    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
       
<script>
		function update_config() {
			var coll = [];
			var inputs = document.getElementById("users").getElementsByTagName("input");
			var labels = document.getElementById("users").getElementsByTagName("label");
			for (var i = 0; i < inputs.length; i++) {
				if (!inputs[i].checked) continue;


				var id = inputs[i].id.replace("user_", "");
				var name = labels[i].innerHTML;


				coll.push({key:id, label:name});
			}
			if (coll.length > 0) {
				scheduler._props.units.options = coll;
				scheduler.matrix.timeline.y_unit = coll;
				scheduler.callEvent("onOptionsLoad", []);
				scheduler.setCurrentView();
			}
		}
		scheduler.attachEvent("onBeforeTooltip", function (id){
			var view = scheduler.getState().mode;
		    if (view == "timeline" || view == "month")
		    	return true;
		    return false;
		});
		scheduler.templates.tooltip_text = function(start,end,ev){
		    return  "<b>Task:</b> " + ev.text + "<br/>" +
		    		"<b>Start date:</b> " +  scheduler.templates.tooltip_date_format(start) + "<br/>" + 
    				"<b>End date:</b> " + scheduler.templates.tooltip_date_format(end) + "<br/>" +
	    			"<b>Owner:</b> " + scheduler.getLabel("user", ev.user) + "<br/>" +
		    		"<b>Status:</b> " + scheduler.getLabel("status", ev.status) + "<br/>" +
		    		"<b>Urgency:</b> " + scheduler.getLabel("urgency", ev.urgency) + "<br/>";
		};

		<s:if test="employee == true">
		scheduler.attachEvent("onBeforeLightbox", function(id) {
			var user = <s:property escape="false" value="userid" />;
			var event = scheduler.getEvent(id);

			if (event.user != user) {
				scheduler.config.buttons_left = ["dhx_cancel_btn"];
				scheduler.config.buttons_right = [];
			} else {
				scheduler.config.buttons_left = ["dhx_save_btn", "dhx_cancel_btn"];
				scheduler.config.buttons_right = [];
			}
			scheduler.resetLightbox();

			scheduler.formSection("description").control.disabled = true;
			var time =  scheduler.formSection("time").control;
			for (var i = 0; i < time.length; i++)
				time[i].disabled = true;
			scheduler.formSection("user").control.disabled = true;
			scheduler.formSection("urgency").control.disabled = true;
			scheduler.formSection("status").control.disabled = (event.user != user) ? true : false;

			return true;
		});
		scheduler.config.dblclick_create = false;
		scheduler.attachEvent("onBeforeDrag", function() { return false; });
		scheduler.attachEvent("onDblClick", function(id) { scheduler.showLightbox(id); return false; });
		scheduler.attachEvent("onClick", function() { return false; });
	</s:if>
	scheduler.locale.labels.confirm_deleting = "Task will be deleted permanently, are you sure?";
	scheduler.locale.labels.new_event = "New task";
		</script>
		<script>
			scheduler.templates.event_class=function(start, end, event){
				return event.status;
			};
		</script>
		<style>
		/* pending event style */
		.dhx_cal_event.pending div,
		.dhx_cal_event_line.pending {
			background-color: #1696AF !important;
			color: #ffffff !important;
		}
		.dhx_cal_event_clear.pending {
			color: #1696AF !important;
		}
		
		
		/* started event style*/
		.dhx_cal_event.started div,
		.dhx_cal_event_line.started {
			background-color: #FD7511 !important;
			color: #ffffff !important;
		}
		.dhx_cal_event_clear.started {
			color: #FD7511 !important;
		}
		
		
		/* completed event style */
		.dhx_cal_event.completed div,
		.dhx_cal_event_line.completed {
			background-color: #76B006 !important;
			color: #ffffff !important;
		}
		.dhx_cal_event_clear.completed {
			color: #76B006 !important;
		}
		</style>
   
</body>
</html>
