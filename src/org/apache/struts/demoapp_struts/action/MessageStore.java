package org.apache.struts.demoapp_struts.action;

public class MessageStore {
	private String scheduler;
	public String minical;
	private String sample_name;
	public String sample_dsc;
	public String name3;
	
	public String getScheduler() {
		return scheduler;
	}
	public void setScheduler(String scheduler) {
		this.scheduler = scheduler;
	}
	public String getname3() {
		return name3;
	}
	public void setname3(String name3) {
		this.name3 = name3;
	}
	
	public String getminical() {
		return minical;
	}
	public void setminical(String minical) {
		this.minical = minical;
	}
	private String data;
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
	public void setSample_name(String sample_name) {
		this.sample_name = sample_name;
	}
	public String getSample_name() {
		return sample_name;
	}
	
	public void setSample_dsc(String sample_dsc) {
		this.sample_dsc = sample_dsc;
	}
	public String getSample_dsc() {
		return sample_dsc;
	}
}
