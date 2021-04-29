

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;


public class Converter 
{
	public List<DataObject> convertCSVToDataObject(String csvData) throws IOException
	{
		List<DataObject> newList = new ArrayList<DataObject>();
		
		StringReader reader = new StringReader(csvData);
		Iterable<CSVRecord> records = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(reader);
		for (CSVRecord record : records) 
		{
			DataObject dataObject = new DataObject();
			
			dataObject.setState(record.get("Province/State").isBlank() ? null : record.get("Province/State"));
			dataObject.setCountry(record.get("Country/Region"));
			dataObject.setLatitude(record.get("Lat"));
			dataObject.setLongitude(record.get("Long"));
		    dataObject.setTotalCases(Integer.parseInt(record.get(record.size() - 1)));
		    
		    newList.add(dataObject);
		}
		return newList;
	}
}
