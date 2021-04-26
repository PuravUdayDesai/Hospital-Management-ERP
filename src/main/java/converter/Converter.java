package converter;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;

import data.object.DataObject;

public class Converter 
{
	public List<DataObject> convertCSVToDataObject(String csvData)
	{
		List<DataObject> newList = null;
		try
		{
			newList = new ArrayList<DataObject>();
		
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
		}
		catch(IOException ie)
		{
			System.out.println("Error: "+ie);
		}
		return newList;
	}
	
	public HashMap<String, Integer> convertCSVToDataObjectCountry(String csvData)
	{
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		try
		{
			StringReader reader = new StringReader(csvData);
			Iterable<CSVRecord> records = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(reader);
			for (CSVRecord record : records) 
			{
				if(data.containsKey(record.get("Country/Region")))
				{
					data.put(record.get("Country/Region"), data.get(record.get("Country/Region")) +  Integer.parseInt(record.get(record.size() - 1)));
				}
				else
				{
					data.put(record.get("Country/Region"), Integer.parseInt(record.get(record.size() - 1)));
				}
			}
			
		}
		catch(IOException ie)
		{
			System.out.println("Error: "+ie);
		}

		
		
		
		return data;
	}
}
