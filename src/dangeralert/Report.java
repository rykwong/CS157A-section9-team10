package dangeralert;


import java.sql.Timestamp;

public class Report {
	private int id;
	private String title;
	private String description;
	private String location;
	private Timestamp datetime;
	private String type;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Report(int id, String title, String description, String location, Timestamp datetime, String type) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.location = location;
		this.datetime = datetime;
		this.type = type;
	}
	public Report() {
		
	}
}

