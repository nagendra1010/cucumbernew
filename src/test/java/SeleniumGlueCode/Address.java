package SeleniumGlueCode;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.junit.AfterClass;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementNotVisibleException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.cucumber.listener.Reporter;

import ReusableFunctions.Reusable;
import Variables.GetDrivers;
import Variables.StaticVariables;
import cucumber.api.DataTable;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.runtime.ExitStatus;
import gherkin.ast.Step;

import junit.framework.Assert;

public class Address {

	Reusable reusableFunctions = new Reusable();

	@Given("^the user is on the login page of \"([^\"]*)\" application$")
	public void the_user_is_on_the_login_page_of_application(String appName, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);
		String page = data.get(0).get("PageName").trim();

		// open URL based on the application name

		if (appName.equalsIgnoreCase("Case Handling System")) {
			GetDrivers.Driver.get(StaticVariables.CaseHandlingSystem_URL);
			GetDrivers.Driver.manage().window().maximize();
		}

		Boolean element = reusableFunctions.getElement(appName, page);

		if (element) {
			Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
			System.out.println("The user is on the login page of " + appName + " application");
			Reporter.addStepLog("The user is on the login page of " + appName + " application");

		}
	}

	@When("^the user enters \"([^\"]*)\" in the \"([^\"]*)\" textbox$")
	public void the_user_enters_in_the_textbox(String enteredText, String objectName, DataTable pageName)
			throws Throwable {
		System.out.println("Entering name!!");
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);
		String page = data.get(0).get("PageName").trim();

		if (enteredText.startsWith("-")) {
			enteredText = enteredText.replaceFirst("-", "");

		} else if (enteredText.startsWith("Noted_")) {
			enteredText = enteredText.replaceFirst("Noted_", "");
			enteredText = reusableFunctions.getValueFromPropertiesExcel("Values", enteredText.trim());
			System.out.println("Value to be entered " + enteredText.trim());
		} else {
			enteredText = reusableFunctions.getTestData(enteredText).trim();
		}

		Boolean element = reusableFunctions.getElement(objectName, page);

		if (element) {
			reusableFunctions.clickElement(objectName, page);

			reusableFunctions.clearElement(objectName, page);
			reusableFunctions.enterTextinElement(objectName, page, enteredText);

			System.out.println(enteredText + " is entered in the " + objectName);
			Reporter.addStepLog(enteredText + " is entered in the " + objectName);

		}

	}

	@When("^the user clicks on the \"([^\"]*)\" button$")
	public void the_user_clicks_on_the_button(String buttonName, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);
		String page = data.get(0).get("PageName").trim();

		Boolean element = reusableFunctions.getElement(buttonName, page);
		if (element) {

			reusableFunctions.waitForelementtobeClickabe(buttonName, page);
			reusableFunctions.highlightElement(buttonName, page, "None");
			reusableFunctions.clickElement(buttonName, page);

			System.out.println(buttonName + " is clicked successfully!!");
			Reporter.addStepLog(buttonName + " is clicked successfully!!");

		}
	}
	
	@Then("^the user selects the  \"([^\"]*)\"$")
	public void the_user_selects_the(String button, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);
		String page = data.get(0).get("PageName").trim();

		Boolean element = reusableFunctions.getElement(button, page);
		if (element) 
		{
			String objXPATH = reusableFunctions.getRelativeXPATH(button, page);
			System.out.println("XPATH is " + objXPATH);
			boolean elementFound = false;
			WebElement webelement = null;
			int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);
			if (objXPATH != null) 
			{
				GetDrivers.Driver.manage().timeouts().implicitlyWait(maxWaitTime, TimeUnit.SECONDS);
				
				webelement = GetDrivers.Driver.findElement(By.xpath(objXPATH));
				((JavascriptExecutor) GetDrivers.Driver).executeScript("arguments[0].scrollIntoView(true);", webelement);
				reusableFunctions.highlightElement(button, page, "None");
				Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
				JavascriptExecutor executor = (JavascriptExecutor)GetDrivers.Driver;
				executor.executeScript("arguments[0].click();", webelement);
				
			}
		}

	}

	@Then("^the \"([^\"]*)\" should be displayed$")
	public void the_should_be_displayed(String appName, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();

		Boolean element = reusableFunctions.getElement(appName, page);

		if (element) {

			System.out.println("The " + appName + " page is displayed successfully");
			Reporter.addStepLog("The " + appName + " page is displayed successfully");
			reusableFunctions.highlightElement(appName, page, StaticVariables.PASS);
			Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());

		}
	}

	@SuppressWarnings("deprecation")
	@Then("^the \"([^\"]*)\" with text \"([^\"]*)\" should be displayed$")
	public void the_with_text_should_be_displayed(String objectName, String expectedObjText, DataTable pageName)
			throws Throwable {

		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		if (expectedObjText.startsWith("-")) {
			expectedObjText = expectedObjText.replaceFirst("-", "");
		} else if (expectedObjText.startsWith("Noted_")) {
			expectedObjText = expectedObjText.replaceFirst("Noted_", "");
			expectedObjText = reusableFunctions.getValueFromPropertiesExcel("Values", expectedObjText.trim());
			System.out.println("Value to be entered " + expectedObjText.trim());
		}

		else {
			expectedObjText = reusableFunctions.getTestData(expectedObjText).trim();
		}

		Boolean element = reusableFunctions.getElement(objectName, page);

		if (element) {

			String actualResult = reusableFunctions.getElementText(objectName, page);

			if (actualResult != null) {
				System.out.println("Expected Text: " + expectedObjText.trim());
				System.out.println("Actual Text: " + actualResult.trim());
				if (actualResult.trim().contentEquals(expectedObjText.trim())) {
					reusableFunctions.highlightElement(objectName, page, StaticVariables.PASS);
					Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
					Reporter.addStepLog(actualResult.trim() + " matches with the expected Result "
							+ expectedObjText.trim() + " in the " + objectName.trim());
					System.out.println(actualResult.trim() + " matches with the expected Result "
							+ expectedObjText.trim() + " in the " + objectName.trim());
				} else {
					reusableFunctions.highlightElement(objectName, page, StaticVariables.FAIL);
					Assert.assertEquals(actualResult.trim(), expectedObjText.trim(),
							actualResult.trim() + " doesnot matches with the expected Result " + expectedObjText.trim()
									+ " in the " + objectName.trim());

				}
			} else {
				Assert.fail("Element Text for " + objectName + " is not present");
			}
		} else {
			Assert.fail("Element " + objectName + " is not present");
		}
	}

	@Then("^the user  double clicks on the \"([^\"]*)\" button$")
	public void the_user_double_clicks_on_the_button(String buttonName, DataTable pageName) throws Throwable {

		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();

		Boolean element = reusableFunctions.getElement(buttonName, page);

		if (element) {

			reusableFunctions.doubleClick(buttonName, page);
			System.out.println("The " + buttonName + " is double clicked successfully");
			Reporter.addStepLog("The " + buttonName + " is double clicked successfully");

		} else {
			System.err.println(buttonName + " is not found");
			Assert.fail(buttonName + " is not found");
		}
	}

	@When("^user enters \"([^\"]*)\" to value$")
	public void user_enters_to_value(String testDataName) throws Throwable {

		System.out.println(reusableFunctions.getTestData(testDataName));
	}

	@Then("^the value of \"([^\"]*)\" should be \"([^\"]*)\"$")
	public void the_value_of_should_be(String object, String expectedText, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();

		Boolean element = reusableFunctions.getElement(object, page);

		if (expectedText.startsWith("-")) {
			expectedText = expectedText.replaceFirst("-", "");
		} else {
			expectedText = reusableFunctions.getTestData(expectedText).trim();
		}

		if (element) {

			String elementText = reusableFunctions.getAttributeofElement(object, page, "value");
			System.out.println("Expected Value : " + expectedText.trim());
			System.out.println("Actual Value : " + elementText.trim());
			if (elementText.trim().contentEquals(expectedText.trim())) {
				reusableFunctions.highlightElement(object, page, StaticVariables.PASS);
				Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
				Reporter.addStepLog(elementText.trim() + " matches with the expected Result " + expectedText.trim()
						+ " in the " + object.trim());
				System.out.println(elementText.trim() + " matches with the expected Result " + expectedText.trim()
						+ " in the " + object.trim());
			} else {
				reusableFunctions.highlightElement(object, page, StaticVariables.FAIL);
				Assert.fail(elementText.trim() + " does not match with the expected Result " + expectedText.trim()
						+ " in the " + object.trim());
			}
		}

	}
	
	@Given("^the user clicks on the \"([^\"]*)\" till the \"([^\"]*)\" matches with \"([^\"]*)\"$")
	public void the_user_clicks_on_the_till_the_matches_with(String objName, String TextObject, String expectedText, DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		String identification=data.get(0).get("Identification").trim();
		String maxTimeOut=data.get(0).get("MaximumTimeOut").trim();
		int maximumTime=Integer.parseInt(maxTimeOut);
		maximumTime=maximumTime*1000;
		Boolean element = false;
		Boolean textElement=false;
		String actualElementText = null;
		boolean validation=false;
		if (expectedText.startsWith("-")) {
			expectedText = expectedText.replaceFirst("-", "");
		} else {
			expectedText = reusableFunctions.getTestData(expectedText).trim();
		}
		
		int timeInterval=maximumTime/5;
		int i=1;
		while(i<=timeInterval)
		{
			if(objName.equalsIgnoreCase("Case Refresh"))
			{
				boolean secElement=reusableFunctions.getElement("OverFlow", page);
				
				if(secElement!=false)
				{
					reusableFunctions.clickElement("OverFlow", page);
					element = reusableFunctions.getElement(objName, page);
					reusableFunctions.clickElement(objName.trim(), page);
				}
			}else
			{
				element = reusableFunctions.getElement(objName, page);
				if(element!=false)
				{
					reusableFunctions.clickElement(objName.trim(), page);
				}
				
			}
			textElement=reusableFunctions.getElement(TextObject, page);
			if(textElement)
			{
				actualElementText=reusableFunctions.getElementText(TextObject, page);
			}
		
			if(actualElementText.contentEquals(expectedText))
			{
				System.out.println("Text is successfully updated and verified after"+i*5000+ "seconds");
				validation=true;
				break;
			}
			else
			{
				System.out.println("Text is not changed yet");
				System.out.println("Waiting and trying again.....");
				Thread.sleep(5000);
				i++;
			}
		}
		
		if(validation)
		{
			System.out.println("Text is successfully updated and verified after"+i*5000+ "seconds");
			Reporter.addScenarioLog("Text is successfully updated and verified after"+i*5000+ "seconds");
		}
		else
		{
			System.out.println("Text not found after "+maximumTime+" seconds");
			Assert.fail("Text not found after "+maximumTime+" seconds");
		}
		
	}

	@When("^the user enters \"([^\"]*)\" in the \"([^\"]*)\" textbox and then clicks on the \"([^\"]*)\" button$")
	public void the_user_enters_in_the_textbox_and_then_clicks_on_the_button(String enteredText, String objectName, String buttonToClick,DataTable pageName) throws Throwable {
		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);

		String page = data.get(0).get("PageName").trim();
		
		

		if (enteredText.startsWith("-")) {
			enteredText = enteredText.replaceFirst("-", "");

		} else if (enteredText.startsWith("Noted_")) {
			enteredText = enteredText.replaceFirst("Noted_", "");
			enteredText = reusableFunctions.getValueFromPropertiesExcel("Values", enteredText.trim());
			System.out.println("Value to be entered " + enteredText.trim());
		} else {
			enteredText = reusableFunctions.getTestData(enteredText).trim();
		}

		Boolean element = reusableFunctions.getElement(objectName, page);

		if (element) {
			reusableFunctions.doubleClick(objectName, page);
			//reusableFunctions.clickElement(objectName, page);

			reusableFunctions.clearElement(objectName, page);
			reusableFunctions.enterTextinElement(objectName, page, enteredText);
			Thread.sleep(1000);
			
			
			System.out.println(enteredText + " is entered in the " + objectName);
			Reporter.addStepLog(enteredText + " is entered in the " + objectName);

		}
		
		Boolean elementButton = reusableFunctions.getElement(buttonToClick, page);
		if (element) {
			
			reusableFunctions.highlightElement(buttonToClick, page, "None");
			Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
			JavascriptExecutor executor = (JavascriptExecutor)GetDrivers.Driver;

			reusableFunctions.waitForelementtobeClickabe(buttonToClick, page);
			
			reusableFunctions.clickElement(buttonToClick, page);

			System.out.println(buttonToClick + " is clicked successfully!!");
			Reporter.addStepLog(buttonToClick + " is clicked successfully!!");
			

		}
		
	}
	
	@Given("^the user again clicks on \"([^\"]*)\" if \"([^\"]*)\" is not visible$")
	public void the_user_again_clicks_on_if_is_not_visible(String buttonName, String objecttoFind, DataTable pageName) throws Throwable {

		List<Map<String, String>> data = pageName.asMaps(String.class, String.class);
		String page = data.get(0).get("PageName").trim();
		WebElement elementToFind = null;

		String buttonXPATH = reusableFunctions.getRelativeXPATH(buttonName, page);
		
		try
		{
			String objXPATH = reusableFunctions.getRelativeXPATH(objecttoFind, page);
			 elementToFind = GetDrivers.Driver.findElement(By.xpath(objXPATH));
			Actions actions = new Actions(GetDrivers.Driver);
			
			
			actions.moveToElement(elementToFind);
			actions.build().perform();
			int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);
			WebDriverWait wait = new WebDriverWait(GetDrivers.Driver, maxWaitTime);
			wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(objXPATH)));
			
			//go to element using jscript
			
			actions.moveToElement(elementToFind).perform();
			WebElement elementWait = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(objXPATH)));
			
			
		}catch(Exception e)
		{
			System.out.println("Clicking on Search again to make result visible");
			System.out.println("Trying once more");
			
			
		
			WebElement element = GetDrivers.Driver.findElement(By.xpath(buttonXPATH));
			if (element!=null) {

				reusableFunctions.waitForelementtobeClickabe(buttonName, page);
				reusableFunctions.highlightElement(buttonName, page, "None");
				reusableFunctions.clickElement(buttonName, page);
				Thread.sleep(2000);

				System.out.println(buttonName + " is clicked successfully!!");
				Reporter.addStepLog(buttonName + " is clicked successfully!!");
				String objXPATH = reusableFunctions.getRelativeXPATH(objecttoFind, page);
			WebElement	webElement = GetDrivers.Driver.findElement(By.xpath(objXPATH));
				((JavascriptExecutor)GetDrivers.Driver).executeScript("arguments[0].scrollIntoView();", webElement);
				
				

			}
		}
	}
}
