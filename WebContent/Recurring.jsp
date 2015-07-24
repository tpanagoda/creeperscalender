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
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="active-menu"  href="index.html"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="ui.html"><i class="fa fa-desktop fa-3x"></i> UI Elements</a>
                    </li>
                    <li>
                        <a  href="tab-panel.html"><i class="fa fa-qrcode fa-3x"></i> Tabs & Panels</a>
                    </li>
						   <li  >
                        <a   href="chart.html"><i class="fa fa-bar-chart-o fa-3x"></i> Morris Charts</a>
                    </li>	
                      <li  >
                        <a  href="table.html"><i class="fa fa-table fa-3x"></i> Table Examples</a>
                    </li>
                    <li  >
                        <a  href="form.html"><i class="fa fa-edit fa-3x"></i> Forms </a>
                    </li>				
					
					                   
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Link</a>
                                    </li>

                                </ul>
                               
                            </li>
                        </ul>
                      </li>  
                  <li  >
                        <a  href="blank.html"><i class="fa fa-square-o fa-3x"></i> Blank Page</a>
                    </li>	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12" >
                     <h1><div class="text" >Event Calendar</div></h1>   
                    
                     
                    
                   
                    </div>
                    
                   
                </div>              
                 <!-- /. ROW  -->
                  <hr />
              
             

              
                 <!-- /. ROW  -->
                <hr />                
                <div class="row">
                    <div class="col-md-8 col-sm-12 col-xs-12">  
	<div class="content">					
			<div class="scheduler" id="scheduler" >
			<div class="rightcol">
			<div class="minical" id="minical"></div>
				<s:property escape="false" value="planner" />
			</div>
			</div>
			</div>
		     </div>
                    
                    
             
                     <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-desktop"></i>
                </span>
                
             </div>
			
    </div>
                        
        </div>
                 <!-- /. ROW  -->
                <div class="row"> 
                    
                      
                               <div class="col-md-9 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                      
                    </div>            
                </div>
                <!--user_screen-->
                    <div class="col-md-3 col-sm-12 col-xs-12" style="height:440px; margin-top:-1090px;">                       
                  <div class="filter" id="filter">
					<div class="f_header"><h3>Employees</h3></div>
					<div class="f_list">
						<table id="users">
							<s:iterator value="users" status="userStatus">
								<tr class="<s:if test="#userStatus.even == true">even</s:if><s:else>odd</s:else>">
									<td class="checkbox"><input type="checkbox" id="user_<s:property value="id"/>" checked onchange="update_config();" /></td>
									<td class="last"><label for="user_<s:property value="id" />"><s:property value="name" /></label></td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				
                
           </div>
           	<!--end user screen-->
                            <!-- /. ROW  -->
               
                 
               
                 <!-- /. ROW  -->
                
                 <!-- /. ROW  -->           
    
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

