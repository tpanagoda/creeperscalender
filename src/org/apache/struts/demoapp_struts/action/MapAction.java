package org.apache.struts.demoapp_struts.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.demoapp_struts.model.CustomEventsManager;
import org.apache.struts.demoapp_struts.model.CustomMapEventsManager;
import org.apache.struts.demoapp_struts.model.CustomRecEventsManager;
import org.apache.struts.demoapp_struts.model.User;
import org.apache.struts.demoapp_struts.util.HibernateUtil;
import org.apache.struts2.ServletActionContext;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.controls.DHXAgendaView;
import com.dhtmlx.planner.controls.DHXGridView;
import com.dhtmlx.planner.controls.DHXGridViewColumn;
import com.dhtmlx.planner.controls.DHXLightboxMiniCalendar;
import com.dhtmlx.planner.controls.DHXLightboxMultiselect;
import com.dhtmlx.planner.controls.DHXLightboxSelect;
import com.dhtmlx.planner.controls.DHXLightboxText;
import com.dhtmlx.planner.controls.DHXMapView;
import com.dhtmlx.planner.controls.DHXMiniCalendar;
import com.dhtmlx.planner.controls.DHXTimelineView;
import com.dhtmlx.planner.controls.DHXUnitsView;
import com.dhtmlx.planner.controls.DHXTimelineView.RenderModes;
import com.dhtmlx.planner.controls.DHXTimelineView.XScaleUnits;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension;
import com.opensymphony.xwork2.ActionSupport;

public class MapAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	

	
	
	private List<User> users;
	private Boolean employee;
	private String username;
	private String userid;
	private String planner;
	private String events;
	
	private MessageStore messageStore = new MessageStore();
	public MessageStore getMessageStore() {
		return messageStore;
	}

	public void setMessageStore(MessageStore messageStore) {
		this.messageStore = messageStore;
	}
	
	public List<User> getUsers() {
		return users;
	}
	public Boolean getEmployee() {
		return employee;
	}
	public String getUsername() {
		return username;
	}
	public String getUserid() {
		return userid;
	}
	public String getPlanner() {
		return planner;
	}
	public MessageStore getEvents() {
		return messageStore;
	}
	
	

	public String javaplanner() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession(true);
		if (session.getAttribute("email") == null) {
			return ERROR;
		}
		
    	
		DHXPlanner planner = new DHXPlanner("./codebase/", DHXSkin.CLASSIC);
		planner.setInitialDate(2015, 1, 7);
		planner.config.setScrollHour(8);
		planner.setWidth(900);
		planner.xy.setMapDateWidth(160);
		planner.xy.setMapDescriptionWidth(300);
		planner.load("06_events", DHXDataFormat.JSON);
		planner.data.dataprocessor.setURL("06_events");
		planner.extensions.add(DHXExtension.RECURRING);
		planner.views.add(new DHXMapView());
    	DHXMapView map = (DHXMapView) planner.views.getView(3);
    	map.setStartDate(2013, 1, 1);
    	planner.setInitialView("map");
    	
    	
   

    	// creates mini-calendar
    	DHXMiniCalendar cal2 = new DHXMiniCalendar("minical2");
    	cal2.setNavigation(true);
    	planner.calendars.add(cal2);
    	
    	
    	DHXGridView view = new DHXGridView();
    	view.addOption(new DHXGridViewColumn("text", "Text"));
    	view.addOption(new DHXGridViewColumn("start_date", "Start date", 200));
    	view.addOption(new DHXGridViewColumn("end_date", "End date", 200));
    	view.setFrom(2013, 1, 1);
    	planner.views.add(view);
    	
	DHXAgendaView agenda =new DHXAgendaView();
    	
    	agenda.setStartDate(2012, 11, 20);
    	agenda.setEndDate(2013, 02, 01);
    	planner.views.add(agenda);
    	
    	planner.calendars.attachMiniCalendar();
    	planner.lightbox.add(new DHXLightboxMiniCalendar("cal", "Time period"));
    	
    	DHXLightboxText loc = new DHXLightboxText("event_location", "Location");
    	loc.setHeight(40);
    	planner.lightbox.add(loc);


    	users = (new CustomEventsManager(request)).getUsers();
    	employee = !session.getAttribute("type").toString().equals("manager");
    	username = session.getAttribute("name").toString();
    	userid = session.getAttribute("id").toString();
    	
    	

		messageStore.setScheduler(planner.render());
		messageStore.setSample_name("Map view");
		messageStore.setSample_dsc("Map view integrates Agenda view with Google Maps that allows you to display locations associated with the calendar events on the map. You can specify the event location in 2 ways: to specify the address in the event description or to set the point right on Google Maps.");
		
		messageStore.setminical("inactive-menu");
		messageStore.setSample_dsc("inactive-menu");
		messageStore.setname3("active-menu");
		return SUCCESS;
		
	}
	
 



	public String login() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession(true);
		if (session.getAttribute("email") != null)
			return LOGIN;

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if (email == null || password == null)
			return SUCCESS;

		Session s = HibernateUtil.getSessionFactory().openSession();
		List<User> users = s.createCriteria(User.class)
				.add(Restrictions.eq("email", email))
				.add(Restrictions.eq("password", password))
				.list();

		if (users.size() == 0)
			return ERROR;

		session.setAttribute("id", users.get(0).getId());
		session.setAttribute("email", users.get(0).getEmail());
		session.setAttribute("name", users.get(0).getName());
		session.setAttribute("type", users.get(0).getType());
		return LOGIN;
	}

	public String logout() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession(true);
		session.removeAttribute("id");
		session.removeAttribute("email");
		session.removeAttribute("name");
		session.removeAttribute("type");
		return SUCCESS;
		
		
	}
	public String events_06() throws Exception {
		CustomMapEventsManager evs = new CustomMapEventsManager(ServletActionContext.getRequest());
		messageStore.setData(evs.run());
		return SUCCESS;
	}
	private InputStream ical;
	public InputStream getIcal() {
		return ical;
	}

	public String ical_163() throws Exception {
		String data = ServletActionContext.getRequest().getParameter("ical");
		byte[] bytes = data.getBytes("UTF-8");
		ical = new ByteArrayInputStream(bytes);
		return SUCCESS;
	}
}
