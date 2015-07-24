package org.apache.struts.demoapp_struts.model;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.demoapp_struts.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.apache.struts.demoapp_struts.action.database;
import org.apache.struts.demoapp_struts.model.EventRec;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomRecEventsManager extends DHXEventsManager {
String user_id="";
String query ="";
java.sql.Connection conn;
java.sql.PreparedStatement ps;
java.sql.ResultSet result;
	public CustomRecEventsManager(HttpServletRequest request) {
		
		super(request);
		
		
	}

	public Iterable<DHXEv> getEvents() {
		
		HttpSession s = getRequest().getSession(true);
		User user = getUser(s.getAttribute("id").toString());
		
	
		
		 ArrayList events = new ArrayList();
         DHXEventsManager.date_format="yyyy-MM-dd HH:mm:ss";
         List<DHXEv> evs = new ArrayList<DHXEv>();
         DHXEvent ev1 = new DHXEvent();
        try
        {
        	 Connection conn =database.getConnection();
        	
        	 String query ="select event_id,start_date,end_date,text,rec_type,event_pid,event_length from events_rec where userid=?";
        		ps = conn.prepareStatement(query);
    			ps.setString(1, user.id.toString());
    			
        	 ResultSet res = ps.executeQuery();
        	while(res.next())
        	{
        		DHXEvent e= new DHXEvent();
        		e.setId(Integer.parseInt(res.getString("event_id")));
        		e.setStart_date(res.getString("start_date"));
        		e.setEnd_date(res.getString("end_date"));
        		e.setText(res.getString("text"));
        		e.setText(res.getString("text"));
        		
        		evs.add(e);
        		
        		
        		
        		
        	}
        	conn.close();
        }
catch(Exception ex)
        {ex.printStackTrace();}
        
        DHXEventsManager.date_format="MM/dd/yyyy HH:mm";
         return evs;
	}

	@Override
	public DHXStatus saveEvent(DHXEv event, DHXStatus status) {
		
		try {
			
	 conn = database.getConnection();
   		 ps = null;
   		 result = null;
   		
   		EventRec e = (EventRec) event;
   		
   			String query = null;
   			String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").
                                               format(((DHXEv) e).getStart_date());
   			String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").
                                             format(((DHXEv) e).getEnd_date());
   			
		Session session = HibernateUtil.getSessionFactory().openSession();
		
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			if (status == DHXStatus.UPDATE)
				session.update(event);
			else if (status == DHXStatus.DELETE) {
				session.delete(event);

				/** we should delete all sub-events from series
				 *  http://docs.dhtmlx.com/doku.php?id=dhtmlxscheduler:recurring_events#editing_deleting_a_certain_occurrence_in_the_series
				 */
				List<EventRec> evs = session.createCriteria(EventRec.class).
						add(Restrictions.
						eq("event_pid", event.getId())).
						list();
				for (int i = 0; i < evs.size(); i++)
					session.delete(evs.get(i));

			} 
			else if (status == DHXStatus.INSERT)
			{
				HttpSession s = getRequest().getSession(true);
				User user = getUser(s.getAttribute("id").toString());
				try
				{
				 query = "INSERT INTO events_rec (event_id, text, start_date, end_date,"+
						   " rec_type, event_length, event_pid,userid) VALUES (null, ?, ?, ?, ?, ?, ?,?)";
						   				ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
						   				ps.setString(1, e.getText());
						   				ps.setString(2, start_date);
						   				ps.setString(3, end_date);
						   				ps.setString(4, e.getRec_type());
						   				ps.setInt(5, e.getEvent_length());
						   				ps.setInt(6, e.getEvent_pid());
						   				ps.setString(7, user.id.toString());
						   			
						   				if (ps!=null) {
						   					ps.executeUpdate();
						   					result = ps.getGeneratedKeys();
						   					if (result.next()) {
						   						event.setId(result.getInt(1));
						   					}
						   				}
				}
						   					
						   					
						   				catch(Exception d)
						   				{
						   					
						   					d.printStackTrace();
						   					
						   				}
			
			}
			

			
			
			
		}
   		
   		catch (RuntimeException ss) {
			ss.printStackTrace();
		} finally{
			 if (result != null) try { result.close(); } catch (SQLException e1) {}
	   	        if (ps != null) try { ps.close(); } catch (SQLException e1) {}
	   	        if (conn != null) try { conn.close(); } catch (SQLException e1) {}
		}
   		
		
		
   		

		return status;
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
	@Override
	public DHXEv createEvent(String id, DHXStatus status) {
		return new EventRec();
	}
}