package data.object;

public class DataObject 
{
	private String state;
	private String country;
	private String latitude;
	private String longitude;
	private Integer totalCases;
	
	public DataObject() {
		super();
	}

	public DataObject(String state, String country, String latitude, String longitude, Integer totalCases) {
		super();
		this.state = state;
		this.country = country;
		this.latitude = latitude;
		this.longitude = longitude;
		this.totalCases = totalCases;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public Integer getTotalCases() {
		return totalCases;
	}

	public void setTotalCases(Integer totalCases) {
		this.totalCases = totalCases;
	}

	@Override
	public String toString() {
		return "{\tstate=" + state + ",\n\tcountry=" + country + ",\n\tlatitude=" + latitude + ",\n\tlongitude="
				+ longitude + ",\n\ttotalCases=" + totalCases + "\n}";
	}
	
	
	
}
