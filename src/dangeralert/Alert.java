package dangeralert;

public class Alert {
	int alertid;
	int userid;
	String type;
	String city;
	
	public Alert(int alertid, int userid, String type, String city) {
		super();
		this.alertid = alertid;
		this.userid = userid;
		this.type = type;
		this.city = city;
	}
	public int getAlertid() {
		return alertid;
	}
	public void setAlertid(int alertid) {
		this.alertid = alertid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
}
