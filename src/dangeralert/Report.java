package dangeralert;

public class Report {
	private int reportid;
	private String title;
	private String description;
	private String location;
	private String datetime;
	private String type;
	
	
	public Report(int id,String title, String des, String location, String datetime,String type) {
		this.reportid = id;
		this.datetime = datetime;
		this.description = des;
		this.title = title;
		this.location = location;
		this.type = type;
	}
	
	public void setId(int id) {
		this.reportid = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setDescription(String des) {
		this.description = des;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public int getId() {
		return this.reportid;
	}

	public String getTitle() {
		return this.title;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public String getLocation() {
		return this.location;
	}
	
	public String getDatetime() {
		return this.datetime;
	}
	
	public String getType() {
		return this.type;
	}
	

}
