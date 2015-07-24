<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">  
function matchpass(){  
var firstpassword=document.f1.pass.value;
var secondpassword=document.f1.repass.value;  
  
if(firstpassword==secondpassword){  
	document.getElementById("check").innerHTML = "New Employee Add to the database Sucessfully!!";
	 window.alert("Registration Complete");
return true;  

}  
else{  
	document.getElementById("check").innerHTML = "OOps...Something Went Wrong Check username\password!";

return false;  
}  
}

function sucess()
{	document.getElementById("check").innerHTML = "New Employee Add to the database Sucessfully!!";

 window.alert("Registration Complete");
	
	}
</script> 
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
                        <a class="active-menu"  href="Employee.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Employee</a>
                    </li>
                    		
                    <li>
                        <a   href="AboutUs.jsp"><i class="fa fa-qrcode fa-3x"></i> Help</a>
                    </li>
						 
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12"  style=" height:200px; background-image:url(assets/img/side_bar.png); background-repeat:no-repeat;background-size: 1200px 200px;opacity: 1;background-color:inherit; ">
                    
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
             
                <div class="row"> 
                     <h2>Employee Registration</h2>   
                        <h5> </h5>
                      <span id="check" style="color: red;"> </span>
                               <div class="col-md-6 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                 <form role="form" name="f1" onsubmit="return matchpass();  return sucess();" method="post" action="Registration.jsp">
                                        <div class="form-group">
                                         <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control"  name="email"/>
                                          
                                        </div>
                                        
                                            <label> Employee Name</label>
                                            <input class="form-control"  name="fname"/>
                                          
                                     
                                        
                                     
                                        
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control" type="password" name="pass" placeholder="PLease Enter Password" />
                                             <div class="form-group">
                                            <label> Re-Password</label>
                                            <input class="form-control" type="password" name="repass" placeholder="PLease Enter Re-Password" /> 
                                            
                              
                                                </label>
                                            </div>
                                        </div>
                                      
                                      
                                       
                                        
                                        <div class="form-group">
                                            <label>Enter Employee Type</label>
                                            <select class="form-control" name="pick">
                                                <option value="Employee" >Employee</option>
                                                <option value="Manager">Manager</option>
                                               
                                            </select>
                                        </div>
                                   
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-primary">Reset Button</button>

                                    </form>
                        </div>
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
                        </div>
                    </div>  
                    
                              
                </div>
                     
                
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
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
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
