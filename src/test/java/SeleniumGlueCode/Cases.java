package SeleniumGlueCode;

import static org.junit.Assert.fail;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.Select;

import com.cucumber.listener.Reporter;

import ReusableFunctions.Reusable;
import Variables.GetDrivers;
import Variables.StaticVariables;
import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import junit.framework.Assert;

public class Cases {

	Reusable reusableFunctions = new Reusable();

	@Then("^the \"([^\"]*)\"st searched result be selected$")
	public void the_st_searched_result_be_selected(String searchedNumber) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		int number = Integer.parseInt(searchedNumber);
		int i = 1;
		while (i <= number) {

		}
	}

	@Then("^the user allows \"([^\"]*)\" seconds to load the \"([^\"]*)\"$")
	public void the_user_allows_seconds_to_load_the(String time, String objName) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		int time_to_load = Integer.parseInt(time);

		Thread.sleep(time_to_load * 1000);
		System.out.println("Waited for " + time_to_load + " seconds");

	}

	@Then("^changes the value of \"([^\"]*)\" to \"([^\"]*)\"$")
	public void changes_the_value_of_to(String objName, String expectedText, DataTable pageName) throws Throwable {

		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		Boolean element = reusableFunctions.getElement(objName, page);
		if (element) {
			String actualResult = reusableFunctions.getElementText(objName, page);

			if (expectedText.trim().equalsIgnoreCase(actualResult)) {
				reusableFunctions.highlightElement(objName, page, StaticVariables.PASS);
				Reporter.addStepLog("The value of " + objName + " is set to " + expectedText + " by default");
				reusableFunctions.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());

			} else {
				reusableFunctions.highlightElement(objName, page, StaticVariables.PASS);
				reusableFunctions.clickElement(objName, page);

				System.out.println(" The value of " + objName + " is set to " + expectedText);
				Reporter.addStepLog("The value of " + objName + " is set to " + expectedText);
				reusableFunctions.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());

			}
		} else {
			Assert.fail("Element " + objName + " is not present");
		}

	}

	@When("^the user selects \"([^\"]*)\" from the \"([^\"]*)\"$")
	public void the_user_selects_from_the(String option, String objName, DataTable pageName) throws Throwable {

		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		Boolean element = reusableFunctions.getElement(objName, page);
		if (element) {

			boolean result = reusableFunctions.selectValueFromDropdownByText(objName, page, option.trim());
			if (result) {
				reusableFunctions.highlightElement(objName, page, StaticVariables.PASS);
				reusableFunctions.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
				Reporter.addStepLog(option + " selected in the " + objName);
				System.out.println(option + " selected in the " + objName);

			} else {
				reusableFunctions.highlightElement(objName, page, StaticVariables.FAIL);
				Assert.fail(option + " NOT selected in the " + objName);
				System.err.println(option + " NOT selected in the " + objName);
			}
		} else {
			Assert.fail(objName + " NOT FOUND ");
			System.err.println(objName + " NOT FOUND ");
		}
	}

	@Then("^the \"([^\"]*)\" should match with \"([^\"]*)\"$")
	public void the_should_match_with(String sourceObjName, String dataName, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		String identifier = data.get(0).get("Identification").trim();
		Boolean element = reusableFunctions.getElement(sourceObjName, page);
		String elementText = null;
		if (element) {

			if (identifier.equalsIgnoreCase("Text")) {
				elementText = reusableFunctions.getElementText(sourceObjName, page);
			} else if (identifier.equalsIgnoreCase("Value")) {
				elementText = reusableFunctions.getAttributeofElement(sourceObjName, page, "value");
			} else {
				System.out.println("Some other identifier used which is not yet configured!!");
			}

			String value_To_Validate = reusableFunctions.getValueFromPropertiesExcel("Values", dataName);
			if (elementText.trim().contentEquals(value_To_Validate.trim())) {
				reusableFunctions.highlightElement(sourceObjName, page, StaticVariables.PASS);
				reusableFunctions.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
				Assert.assertEquals(elementText.trim(), value_To_Validate.trim());
				Reporter.addStepLog(elementText.trim() + "matches with expected Text--" + value_To_Validate.trim());
			} else {
				reusableFunctions.highlightElement(sourceObjName, page, StaticVariables.FAIL);
				reusableFunctions.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
				Assert.fail(elementText.trim() + "doesnot match with expected Text--" + value_To_Validate.trim());
				System.err
						.println(elementText.trim() + "doesnot match with expected Text--" + value_To_Validate.trim());
			}
		} else {
			System.out.println(sourceObjName + " is not found");
		}

	}

	@When("^the user enters \"([^\"]*)\" in the \"([^\"]*)\" Itextbox$")
	public void the_user_enters_in_the_Itextbox(String enteredText, String objName, DataTable pageName)
			throws Throwable {

		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		String iframeID = null;

		// All Frames to be given here by objname
		if (objName.equalsIgnoreCase("Adresse")) {
			iframeID = "WebResource_autocompletefelt";
			GetDrivers.Driver.switchTo().frame(iframeID);
			System.out.println("Switching to iframeID is completed");
		}

		// start object finding again

		if (enteredText.startsWith("-")) {
			enteredText = enteredText.replaceFirst("-", "");

		} else {
			enteredText = reusableFunctions.getTestData(enteredText).trim();
		}

		Boolean element = reusableFunctions.getElement(objName, page);

		if (element) {
			reusableFunctions.clickElement(objName, page);
			reusableFunctions.clearElement(objName, page);
			reusableFunctions.clearElement(objName, page);
			reusableFunctions.enterTextinElement(objName, page, enteredText);

			reusableFunctions.highlightElement(objName, page, StaticVariables.PASS);

			System.out.println(enteredText + " is entered in the " + objName);
			Reporter.addStepLog(enteredText + " is entered in the " + objName);

		} else {
			Assert.fail(objName + " is not found!!");

		}

		GetDrivers.Driver.switchTo().defaultContent();
	}

	@Then("^the user clicks on the \"([^\"]*)\" Ibutton$")
	public void the_user_clicks_on_the_Ibutton(String objName, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		String iframeID = null;

		// All Frames to be given here by objname
		if (objName.equalsIgnoreCase("Adresse Searched Result")) {
			System.out.println("Entering into iframe");
			iframeID = "WebResource_autocompletefelt";
			GetDrivers.Driver.switchTo().frame(iframeID);
			System.out.println("Frame selected");
		}

		// start object finding again

		Boolean element = reusableFunctions.getElement(objName, page);

		if (element) {

			reusableFunctions.clickElement(objName, page);

			System.out.println(objName + " is clicked successfully");
			Reporter.addStepLog(objName + " is clicked successfully");

		} else {
			System.err.println(objName + " is not found!!");
			Assert.fail(objName + " is not found!!");

		}
		GetDrivers.Driver.switchTo().defaultContent();
	}

	@When("^the user navigates to the \"([^\"]*)\" in a separate browser window$")
	public void the_user_navigates_to_the_in_a_separate_browser_window(String appName) throws Throwable {
		ReusableFunctions.ConfigFileReader configReader = new ReusableFunctions.ConfigFileReader();
		String URL = configReader.getPropertyFromPropertiesFile(appName);
		((JavascriptExecutor) GetDrivers.Driver).executeScript("window.open()");
		StaticVariables.BROWSERTABS = new ArrayList<String>(GetDrivers.Driver.getWindowHandles());
		GetDrivers.Driver.switchTo().window(StaticVariables.BROWSERTABS.get(1));
		GetDrivers.Driver.get(URL);

	}

	@Given("^the user enters \"([^\"]*)\" and \"([^\"]*)\"$")
	public void the_user_enters_and(String userNameObj, String pwdObj, DataTable pageName) throws Throwable {

		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		Boolean Userelement = reusableFunctions.getElement(userNameObj, page);
		Boolean Pwdelement = reusableFunctions.getElement(pwdObj, page);

		if (Userelement == true && Pwdelement == true) {
			// Enter code
			String userNameText = reusableFunctions.getTestData(userNameObj).trim();
			String passText = reusableFunctions.getTestData(pwdObj).trim();

			reusableFunctions.clearElement(userNameObj, page);
			reusableFunctions.enterTextinElement(userNameObj, page, userNameText.trim());

			reusableFunctions.clearElement(pwdObj, page);
			reusableFunctions.enterTextinElement(pwdObj, page, passText.trim());

			Reporter.addStepLog(userNameText + " is set in the field " + userNameObj);
			Reporter.addStepLog(passText + " is set in the field " + pwdObj);

			reusableFunctions.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
		} else {
			Assert.fail(userNameObj + " or" + pwdObj + " is not found");
		}

	}

	@Given("^make a folder$")
	public void make_a_folder() throws Throwable {

		String dir = "\\\\psrvwapp0386\\\\RTA Backups" + "\\\\" + "GIT";

		System.out.println("Final file directory : " + dir);

		// create a directory in the path

		File file = new File(dir);

		if (!file.exists()) {
			file.mkdir();
			System.out.println("Directory is created!");
		} else {
			System.out.println("Directory is already existed!");
		}
	}
}
