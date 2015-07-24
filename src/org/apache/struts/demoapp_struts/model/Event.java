package org.apache.struts.demoapp_struts.model;

import com.dhtmlx.planner.DHXEvent;

public class Event extends DHXEvent {

	public String user;
	public String status;
	public String urgency;

	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUrgency() {
		return urgency;
	}
	public void setUrgency(String urgency) {
		this.urgency = urgency;
	}
}
