package RunnerClass;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.reporter.ExtentHtmlReporter;
import com.cucumber.listener.ExtentCucumberFormatter;
import com.cucumber.listener.Reporter;

import ReusableFunctions.Reusable;
import Variables.StaticVariables;
import cucumber.api.CucumberOptions;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)

@CucumberOptions(features = "src/test/java/Features/", glue = { "SeleniumGlueCode" }, plugin = {
		"com.cucumber.listener.ExtentCucumberFormatter:",
		"json:target/cucumber.json","junit:target/cukes.xml" }, tags = { "@SearchAddressWithLID,@SearchAccountByName" },

		monochrome = true

)

public class TestRunner {

	@BeforeClass
	public static void startExecution() {
		ReusableFunctions.ConfigFileReader configReader = new ReusableFunctions.ConfigFileReader();
		StaticVariables.SHAREDRESULTS = configReader.getPropertyFromPropertiesFile("SHAREDRESULTS");
		StaticVariables.SHAREDPATH = configReader.getPropertyFromPropertiesFile("SHAREDPATH");
		
		try {
			String currentUsersHomeDir = StaticVariables.CURRENTUSERSHOMEDIR;
			
			if (StaticVariables.SHAREDRESULTS.equalsIgnoreCase("TRUE")) {
				String screenshotPath = StaticVariables.SHAREDPATH + "\\Automation\\Screenshots";
				String reportPath = StaticVariables.SHAREDPATH + "\\Automation\\report.html";
//				String jsonFile=StaticVariables.SHAREDPATH+"\\Artifacts\\";
//				Reusable.createDirectoryifPresent(jsonFile);
				System.out.println("Starting the SetUP in SharedPath");
				Reusable.deleteFileifPresent(reportPath);
				Reusable.deleteDirectoryifPresent(screenshotPath);
				File file = new File(reportPath);
				ExtentCucumberFormatter extent = new ExtentCucumberFormatter(file);
	

			} else {
				String screenshotPath = currentUsersHomeDir + "\\target\\cucumber-reports\\ScreenShots";
				String reportPath = currentUsersHomeDir + "\\target\\cucumber-reports\\report.html";
				System.out.println("Starting the SetUP in Project Directory");
				Reusable.deleteFileifPresent(reportPath);
				Reusable.deleteDirectoryifPresent(screenshotPath);
				File file = new File(reportPath);
				ExtentCucumberFormatter extent = new ExtentCucumberFormatter(file);
				Reusable.createExcel();
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@AfterClass
	public static void writeExtentReport() {
		Reporter.loadXMLConfig(new File("config/report.xml"));

		Reporter.setSystemInfo("User Name", System.getProperty("user.name"));
		Reporter.setSystemInfo("Developer", "Subhojit Sadhukhan");
		Reporter.setSystemInfo("Time Zone", System.getProperty("user.timezone"));
		Reporter.setSystemInfo("Application", StaticVariables.OBJECTREPOSITORY);
		Reporter.setSystemInfo("Machine", "Windows 10" + "64 Bit");
		Reporter.setSystemInfo("HostName", Reusable.getHostName());
		
		
			
	
		
	}

}
