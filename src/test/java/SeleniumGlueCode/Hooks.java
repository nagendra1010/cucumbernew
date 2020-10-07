package SeleniumGlueCode;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.chrome.ChromeDriver;

import com.cucumber.listener.ExtentCucumberFormatter;
import com.cucumber.listener.Reporter;

import ReusableFunctions.ExcelFunctions;
import ReusableFunctions.Reusable;
import Variables.GetDrivers;
import Variables.StaticVariables;
import cucumber.api.Scenario;
import cucumber.api.java.After;

import cucumber.api.java.Before;
import cucumber.api.java.BeforeStep;

public class Hooks {
	ReusableFunctions.ConfigFileReader configReader = new ReusableFunctions.ConfigFileReader();

	@Before
	public void beforeScenario(Scenario scenario) {
		Reporter.assignAuthor("Subhojit Sadhukhan -- (M86751)");
		String currentUsersHomeDir = System.getProperty("user.dir");
		System.out.println("RUNNING SCENARIO --> " + scenario.getName());
		StaticVariables.SCENARIO_NAME = scenario.getName().trim();
		// Store all the TestProperties parameters in Static Variables

		StaticVariables.BROWSER = configReader.getPropertyFromPropertiesFile("BROWSER");
		StaticVariables.SCREENSHOTS = configReader.getPropertyFromPropertiesFile("SCREENSHOTS");
		StaticVariables.HIGHLIGHTS = configReader.getPropertyFromPropertiesFile("HIGHLIGHTS");
		StaticVariables.chromeDriverpath = configReader.getPropertyFromPropertiesFile("chromeDriverpath");
		StaticVariables.OBJECTREPOSITORY = configReader.getPropertyFromPropertiesFile("OBJECTREPOSITORY");
		StaticVariables.CaseHandlingSystem_URL = configReader.getPropertyFromPropertiesFile("CaseHandlingSystem_URL");
		StaticVariables.MAX_WAIT_TIME = configReader.getPropertyFromPropertiesFile("MAX_WAIT_TIME");
		StaticVariables.TESTDATAREPO = configReader.getPropertyFromPropertiesFile("TESTDATA");
		StaticVariables.SHAREDRESULTS = configReader.getPropertyFromPropertiesFile("SHAREDRESULTS");
		StaticVariables.SHAREDPATH = configReader.getPropertyFromPropertiesFile("SHAREDPATH");

		// Check whether Browser Parameter is Chrome in TestProperties file

		Reusable reusableFunctions = new Reusable();
		reusableFunctions.selectBrowser(StaticVariables.BROWSER);

	}

	@Before
	public void setUpScenario(Scenario scenario) {
		StaticVariables.message = scenario;
	}

	@After
	public void embedScreenshot(Scenario scenario) throws Exception {

		if (scenario.isFailed()) {

			if (StaticVariables.SHAREDRESULTS.equalsIgnoreCase("TRUE")) {
				try {
					byte[] screenshot = ((TakesScreenshot) GetDrivers.Driver).getScreenshotAs(OutputType.BYTES);
					scenario.embed(screenshot, "image/png");
					System.out.println("Screenshot taken!!");

					TakesScreenshot ts = (TakesScreenshot) GetDrivers.Driver;

					File source = ts.getScreenshotAs(OutputType.FILE);
					File destinationPath = new File(
							StaticVariables.SHAREDPATH + "\\Automation\\ScreenShots\\" + scenario.getName() + ".jpg");
					FileUtils.copyFile(source, destinationPath);

					Reporter.addScreenCaptureFromPath(destinationPath.toString());

					GetDrivers.Driver.quit();
				} catch (WebDriverException wde) {
					System.err.println(wde.getMessage());

					GetDrivers.Driver.quit();
				} catch (ClassCastException cce) {
					cce.printStackTrace();

					GetDrivers.Driver.quit();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

					GetDrivers.Driver.quit();
				}
			} else {

				try {
					byte[] screenshot = ((TakesScreenshot) GetDrivers.Driver).getScreenshotAs(OutputType.BYTES);
					scenario.embed(screenshot, "image/png");

					System.out.println("Screenshot taken!!");

					TakesScreenshot ts = (TakesScreenshot) GetDrivers.Driver;

					File source = ts.getScreenshotAs(OutputType.FILE);
					File destinationPath = new File(
							System.getProperty("user.dir") + "/target/cucumber-reports/ScreenShots/"
									+ System.currentTimeMillis() + scenario.getName() + ".png");
					FileUtils.copyFile(source, destinationPath);
					File destinationPath1 = new File(
							System.getProperty("user.dir") + "/target/cucumber-reports/ScreenShots/"
								 +scenario.getName()+"/" +System.currentTimeMillis()+ ".png");
					FileUtils.copyFile(source, destinationPath1);
					String sourcedir = System.getProperty("user.dir") + "/target/cucumber-reports/ScreenShots/"
							 +StaticVariables.message.getName();
					String dest = System.getProperty("user.dir") + "\\target\\cucumber-reports\\ScreenShots\\"
							 +StaticVariables.message.getName()+".zip";
					Reusable.zipMethod(sourcedir,dest);
					Reusable.updateExcel(scenario,dest);
					Reporter.addScreenCaptureFromPath(destinationPath.toString());
					GetDrivers.Driver.quit();
					
				} catch (WebDriverException wde) {
					System.err.println(wde.getMessage());

					GetDrivers.Driver.quit();
				} catch (ClassCastException cce) {
					cce.printStackTrace();

					GetDrivers.Driver.quit();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

					GetDrivers.Driver.quit();
				}
			}
		} 
		if(!(scenario.isFailed()) && StaticVariables.SCREENSHOTS.equalsIgnoreCase("TRUE") )
		{

			String sourcedir = System.getProperty("user.dir") + "/target/cucumber-reports/ScreenShots/"
					 +StaticVariables.message.getName();
			String dest = System.getProperty("user.dir") + "\\target\\cucumber-reports\\ScreenShots\\"
					 +StaticVariables.message.getName()+".zip";
			Reusable.zipMethod(sourcedir,dest);
			Reusable.updateExcel(scenario,dest);
			GetDrivers.Driver.quit();

		}
		if(!(scenario.isFailed()) && StaticVariables.SCREENSHOTS.equalsIgnoreCase("False") ) {
			String sourcedir = System.getProperty("user.dir") + "/target/cucumber-reports/ScreenShots/"
					 +StaticVariables.message.getName();
			String dest = System.getProperty("user.dir") + "\\target\\cucumber-reports\\ScreenShots\\"
					 +StaticVariables.message.getName()+".zip";
			Reusable.updateExcel(scenario,dest);
			GetDrivers.Driver.quit();
		}

	}

//	@After
//
//	public void afterScenario() {
//		GetDrivers.Driver.close();
//
//	}

}
