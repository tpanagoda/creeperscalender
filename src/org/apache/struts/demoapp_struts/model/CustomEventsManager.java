package org.apache.struts.demoapp_struts.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.demoapp_struts.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
import com.dhtmlx.planner.data.DHXCollection;

public class CustomEventsManager extends DHXEventsManager {

	public CustomEventsManager(HttpServletRequest request) {
		super(request);
	}

	public Iterable<DHXEv> getEvents() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<DHXEv> evs = new ArrayList<DHXEv>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			evs = session.createCriteria(Event.class).list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally{
			session.flush();
			session.close();
		}
		
    	return evs;
	}

	@Override
	public DHXStatus saveEvent(DHXEv event, DHXStatus status) {
		HttpSession s = getRequest().getSession(true);
		Boolean employee = !s.getAttribute("type").toString().equals("manager");

		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();

			if (status == DHXStatus.UPDATE) {
				session.update(event);
			} else if (status == DHXStatus.DELETE) {
				if (employee) return DHXStatus.ERROR;
				session.delete(event);
			} else if (status == DHXStatus.INSERT) {
				if (employee) return DHXStatus.ERROR;
				
				session.save(event);
			}
			session.getTransaction().commit();
			notify((Event) event);
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally{
			session.flush();
			session.close();
		}
		return status;
	}

	@Override
	public DHXEv createEvent(String id, DHXStatus status) {
		return new Event();
	}

	@Override
	public HashMap<String, Iterable<DHXCollection>> getCollections() {
		List<User> users = getUsers();
		ArrayList<DHXCollection> users_list = new ArrayList<DHXCollection>();
		for (int i = 0; i < users.size(); i++) {
			users_list.add(new DHXCollection(users.get(i).getId().toString(), users.get(i).getName()));
		}

		HashMap<String,Iterable<DHXCollection>> c = new HashMap<String,Iterable<DHXCollection>>();
		c.put("users", users_list);

		ArrayList<DHXCollection> status = new ArrayList<DHXCollection>();
		status.add(new DHXCollection("pending", "Pending"));
		status.add(new DHXCollection("started", "Started"));
		status.add(new DHXCollection("completed", "Completed"));
		c.put("status", status);

		ArrayList<DHXCollection> urgency = new ArrayList<DHXCollection>();
		urgency.add(new DHXCollection("low", "Low"));
		urgency.add(new DHXCollection("medium", "Medium"));
		urgency.add(new DHXCollection("high", "High"));
		c.put("urgency", urgency);

		return c;
	}
	
	public List<User> getUsers() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<User> users = new ArrayList<User>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			users = session.createCriteria(User.class).add(Restrictions.eq("type", "employee")).list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally{
			session.flush();
			session.close();
		}
		return users;
	}
	
	public User getUser(String id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<User> users = new ArrayList<User>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			users = session.createCriteria(User.class).add(Restrictions.eq("id", Integer.parseInt(id))).list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally{
			session.flush();
			session.close();
		}
		if (users.size() > 0)
			return users.get(0);
		else
			return null;
	}
	public User getManager() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<User> users = new ArrayList<User>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			users = session.createCriteria(User.class).add(Restrictions.eq("type", "manager")).list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally{
			session.flush();
			session.close();
		}
		if (users.size() > 0)
			return users.get(0);
		else
			return null;
	}
	
	private Boolean notify(Event ev) {
		HttpSession s = getRequest().getSession(true);
		User user = getUser(s.getAttribute("id").toString());
		User owner = getUser(ev.getUser());

		if (user.getType().equals("employee")) {
			User manager = getManager();
			email(manager.getEmail(), "Status of task was changed!", getManagerText(ev, owner, manager));
		} else {
			email(owner.getEmail(), "Task is updated!", getEmployeeText(ev, owner));
		}
		return true;
	}
	
	private String getEmployeeText(Event ev, User user) {
		String text = "Hi, " + user.getName() + "\n";
		text += "You have changes in your tasks:\n";
		text += ev.getText() + "\n";
		text += ev.getStart_date() + " - " + ev.getEnd_date() + "\n";
		text += "Status: " + ev.getStatus() + "\n";
		text += "Urgency: " + ev.getUrgency() + "\n";
		return text;
	}
	
	private String getManagerText(Event ev, User user, User manager) {
		String text = "Hi, " + manager.getName() + "\n";
		text += "Status of the following task was changed to '" + ev.getStatus() + "' by " + user.getName() + ":\n";
		text += "'" + ev.getText() + "'";
		return text;
	}
	
	protected Boolean email(String to, String subject, String body) {

		final String from = "thari0722@gmail.com";
		final String smtp_host = "smtp.gmail.com";
		final String smtp_port = "587";
		final String smtp_user = "thari0722@gmail.com";
		final String smtp_pass = "19900722";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", smtp_host);
		props.put("mail.smtp.port", smtp_port);
		javax.mail.Session session = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(smtp_user, smtp_pass);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("gilbertmalinga@gmail.com"));
			message.setSubject(subject);
			message.setText(body);
 			Transport.send(message);
		} catch (MessagingException e) {
			return false;
		}
		
		return true;
	}

}

