package ReusableFunctions;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class ConfigFileReader {

	
	
	public Properties properties;
	private final String testProperties_filePath = "configuration//TestProperties.properties";
	private final String testSetup_filePath="configuration//TestSetup.properties";
	
	public ConfigFileReader() {
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader(testProperties_filePath));
			properties = new Properties();
			try {
				properties.load(reader);
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("Configuration.properties not found at " + testProperties_filePath);
		}
	}
	
	public String getChromeDriverPath() {
		String driverPath = properties.getProperty("chromeDriverpath");
		
		if (driverPath != null)
			return driverPath;
		else
			throw new RuntimeException("driverPath not specified in the Configuration.properties file.");
	}

	public String getPropertyFromPropertiesFile(String propertyName) {
		String propertyValue = properties.getProperty(propertyName);
		if (propertyValue != null)
			return propertyValue;
		else
			return null;

	}
	
}
