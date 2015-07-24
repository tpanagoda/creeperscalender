package org.apache.struts.demoapp_struts.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.demoapp_struts.model.CustomEventsManager;
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
import com.dhtmlx.planner.controls.DHXLightboxMultiselect;
import com.dhtmlx.planner.controls.DHXLightboxSelect;
import com.dhtmlx.planner.controls.DHXMiniCalendar;
import com.dhtmlx.planner.controls.DHXTimelineView;
import com.dhtmlx.planner.controls.DHXUnitsView;
import com.dhtmlx.planner.controls.DHXTimelineView.RenderModes;
import com.dhtmlx.planner.controls.DHXTimelineView.XScaleUnits;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension;
import com.opensymphony.xwork2.ActionSupport;

public class JobDemoAction extends ActionSupport {

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

		DHXPlanner planner = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
    	planner.setInitialDate(2015, 7, 15);
    	planner.setInitialView("units");
    	planner.config.setScrollHour(8);
    	planner.config.setDisplayedEventColor("#000000");
    	
    	planner.setWidth(990);
    	planner.setHeight(600);
    	planner.load("05_events", DHXDataFormat.JSON);
    	planner.data.dataprocessor.setURL("05_events");
    	planner.config.setDetailsOnCreate(true);
    	planner.config.setFirstHour(10);
    	planner.config.setLastHour(20);
    	
    	
    	planner.extensions.add(DHXExtension.TOOLTIP);
    	planner.toPDF();
    	planner.toICal("16_ical");
    	
    	// create units view
    	DHXUnitsView units = new DHXUnitsView("units", "user", "Units");
    	units.setServerListLink("users");
    	units.setSkipIncorrect(true);
    	planner.views.add(units);

    	// create timeline view
    	DHXTimelineView timeline = new DHXTimelineView("timeline", "user", "Timeline");
    	timeline.setRenderMode(RenderModes.BAR);
    	timeline.setXScaleUnit(XScaleUnits.MINUTE);
        timeline.setXStep(30);
        timeline.setXSize(18);
        timeline.setXStart(20);
        timeline.setXLength(48);
    	timeline.setServerList("users");
    	planner.views.add(timeline);

    	DHXGridView view = new DHXGridView();
    	view.addOption(new DHXGridViewColumn("text", "Text"));
    	view.addOption(new DHXGridViewColumn("start_date", "Start date", 150));
    	view.addOption(new DHXGridViewColumn("end_date", "End date", 150));
    	view.setFrom(2013, 1, 1);
    	planner.views.add(view);
   
		// adds sections in lightbox
    	DHXLightboxSelect sel = new DHXLightboxSelect("user", "Owner");
    	sel.setServerList("users");
    	planner.lightbox.add(sel);

    	
    	DHXAgendaView agenda =new DHXAgendaView();
    	
    	agenda.setStartDate(2012, 11, 20);
    	agenda.setEndDate(2013, 02, 01);
    	
    	planner.views.add(agenda);
    	
//    	DHXLightboxMultiselect mul =new DHXLightboxMultiselect("user", "Owner");
//    	mul.setServerList("users");
//    	planner.lightbox.add(mul);
    	
    	DHXLightboxSelect status = new DHXLightboxSelect("status", "Status");
    	status.setServerList("status");
    	planner.lightbox.add(status);

    	DHXLightboxSelect urgency = new DHXLightboxSelect("urgency", "Urgency");
    	urgency.setServerList("urgency");
    	planner.lightbox.add(urgency);

    	
    	// creates mini-calendar
    	DHXMiniCalendar cal = new DHXMiniCalendar("minical");
    	cal.setNavigation(true);
    	planner.calendars.add(cal);
    	
    	

    	users = (new CustomEventsManager(request)).getUsers();
    	employee = !session.getAttribute("type").toString().equals("manager");
    	username = session.getAttribute("name").toString();
    	userid = session.getAttribute("id").toString();
    	messageStore.setScheduler(planner.render());
    	messageStore.setSample_name("Employee Management");
    	messageStore.setminical("inactive-menu");
		messageStore.setSample_dsc("active-menu");
		messageStore.setname3("inactive-menu");
//		messageStore.setSample_dsc("active-menu");
//		messageStore.setname3("active-menu");
		return SUCCESS;
	}
	
 

	public String events() throws Exception {
		CustomEventsManager evs = new CustomEventsManager(ServletActionContext.getRequest());
		messageStore  .setData(evs.run());
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
	public String events_05() throws Exception {
		CustomEventsManager evs = new CustomEventsManager(ServletActionContext.getRequest());
		messageStore .setData(evs.run());
		return SUCCESS;
	}
	
	private InputStream ical;
	public InputStream getIcal() {
		return ical;
	}

	public String ical_16() throws Exception {
		String data = ServletActionContext.getRequest().getParameter("ical");
		byte[] bytes = data.getBytes("UTF-8");
		ical = new ByteArrayInputStream(bytes);
		return SUCCESS;
	}
	
}