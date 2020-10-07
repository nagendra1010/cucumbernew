package SeleniumGlueCode;

import ReusableFunctions.Reusable;
import Variables.GetDrivers;
import Variables.StaticVariables;
import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Contacts {

	Reusable reusableFunctions = new Reusable();

	@Then("^the user notes the below mention fields for further evaluation$")
	public void the_user_notes_the_below_mention_fields_for_further_evaluation(DataTable Fields) throws Throwable {
		List<Map<String, String>> data = Fields.asMaps(String.class, String.class);
		
		for (int i = 0; i < data.size(); i++) 
		{
			String objectName=data.get(i).get("Fields").trim();
			String page = data.get(i).get("PageName").trim();
			String identifier=data.get(i).get("Identifier").trim();
			Boolean element = reusableFunctions.getElement(objectName, page);
			
			String elementText;
			if (element) 
			{
				if(identifier.equalsIgnoreCase("Value"))
				{
					reusableFunctions.highlightElement(objectName, page, StaticVariables.PASS);
					Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
					 elementText=reusableFunctions.getAttributeofElement(objectName, page, "value");
				}else
				{
					reusableFunctions.highlightElement(objectName, page, StaticVariables.PASS);
					Reusable.takeScreenshot(GetDrivers.Driver, System.currentTimeMillis());
					elementText=reusableFunctions.getElementText(objectName, page);
				}
				
				
				boolean settingValue =reusableFunctions.setValuesToPropertiesExcel("Values", "Value", objectName, elementText);
				
			}
		}
		
		
		System.out.println("All the fields are noted!!");
		
		
	}
	
	@When("^the user clicks on the link text \"([^\"]*)\"$")
	public void the_user_clicks_on_the_link_text(String linkText) throws Throwable {
	  
		if(linkText.startsWith("Noted_"))
		{
			linkText=linkText.replaceFirst("Noted_", "");
			linkText=reusableFunctions.getValueFromPropertiesExcel("Values".trim(), linkText.trim());
		}else if(linkText.startsWith("-"))
		{
			linkText=linkText.replaceFirst("-", "");
		}else
		{
			linkText=reusableFunctions.getTestData(linkText).trim();
		}
		
		
		String objXPATH=reusableFunctions.createDynamicXPATHusingText(linkText);
		System.out.println("Link Text XPATH "+objXPATH);
		WebElement element=GetDrivers.Driver.findElement(By.xpath(objXPATH));
		int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);

		WebDriverWait wait = new WebDriverWait(GetDrivers.Driver, maxWaitTime);
		WebElement elementWait = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(objXPATH)));
		 wait.until(ExpectedConditions.elementToBeClickable(By.xpath(objXPATH)));
		Actions action=new Actions(GetDrivers.Driver);
		action.moveToElement(element).build().perform();
		
		
		element.click();
		
		System.out.println("Link Text is clicked");
	}
}
