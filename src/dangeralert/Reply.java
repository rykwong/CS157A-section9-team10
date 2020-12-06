package dangeralert;

import java.sql.Timestamp;

public class Reply {
	private Report report;
	private int id;
	private int userid;
	private int reportid;
	private String text;
	private Timestamp timestamp;
	
	public Report getReport() {
		return report;
	}
	public void setReport(Report report) {
		this.report = report;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getReportid() {
		return reportid;
	}
	public void setReportid(int reportid) {
		this.reportid = reportid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	
}
