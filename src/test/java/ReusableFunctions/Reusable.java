package ReusableFunctions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.util.concurrent.TimeUnit;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.imageio.ImageWriter;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.AfterClass;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.cucumber.listener.Reporter;

import Variables.GetDrivers;
import Variables.StaticVariables;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import junit.framework.Assert;

public class Reusable {

	/*
	 * Function : selectBrowser Creator : Subhojit Sadhukhan (M86751) Parameters :
	 * browserType(it is set in TestProperties.properties file) Use : Opens a
	 * browser of browserType selected in TestProperties.properties file
	 */
	public void selectBrowser(String browserType) {

		if (StaticVariables.BROWSER.equalsIgnoreCase(browserType)) {
			System.out.println("Browser Selected is Chrome, Opening CHROME BROWSER");
			System.setProperty("webdriver.chrome.driver",
					StaticVariables.CURRENTUSERSHOMEDIR + "\\" + StaticVariables.chromeDriverpath);
			WebDriver driver = new ChromeDriver();
			GetDrivers.Driver = driver;

		}
	}

	/*
	 * Function : readDatafromExcel Creator : Subhojit Sadhukhan (M86751) Parameters
	 * : browserType(it is set in TestProperties.properties file) Use : Opens a
	 * browser of browserType selected in TestProperties.properties file
	 */

	public String getRelativeXPATH(String ObjectName, String pageName) {
		String excelName = StaticVariables.CURRENTUSERSHOMEDIR + "\\ObjectRepository\\"
				+ StaticVariables.OBJECTREPOSITORY + ".xlsx";
		boolean dataFound = false;
		String relativeXPATH = null;
		try {
			ExcelFunctions excel = new ExcelFunctions(excelName);

			for (int i = 2; i <= excel.getlastRowNumber(pageName) + 2; i++) {
				if (excel.getCellData(pageName.trim(), "ObjectName", i).contentEquals(ObjectName)) {
					relativeXPATH = excel.getCellData(pageName.trim(), "Relative XPATH", i);
					dataFound = true;
					break;
				}
			}

			if (dataFound) {
				return relativeXPATH;
			} else {
				return null;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println("Excel/OR is not found");
			System.err.println(excelName);
		}
		return excelName;

	}

	public String getTestData(String TestDataName) {
		
		if(StaticVariables.SHAREDRESULTS.equalsIgnoreCase("TRUE"))
		{
			
			String excelName = StaticVariables.SHAREDPATH + "\\TestData\\" + StaticVariables.TESTDATAREPO
					+ ".xlsx";
			boolean dataFound = false;
			String testDataValue = null;
			try {
				ExcelFunctions excel = new ExcelFunctions(excelName);

				for (int i = 2; i <= excel.getlastRowNumber("TestData") + 2; i++) {
					if (excel.getCellData("TestData".trim(), "ScenarioName", i)
							.contentEquals(StaticVariables.SCENARIO_NAME)) {
						testDataValue = excel.getCellData("TestData".trim(), TestDataName.trim(), i);
						dataFound = true;
						break;
					}
				}

				if (dataFound) {

					return testDataValue;
				} else {
					return null;
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.err.println("Excel/OR is not found");
				System.err.println(excelName);
			}
			return excelName;
		}else
		{
			String excelName = StaticVariables.CURRENTUSERSHOMEDIR + "\\TestData\\" + StaticVariables.TESTDATAREPO
					+ ".xlsx";
			boolean dataFound = false;
			String testDataValue = null;
			try {
				ExcelFunctions excel = new ExcelFunctions(excelName);

				for (int i = 2; i <= excel.getlastRowNumber("TestData") + 2; i++) {
					if (excel.getCellData("TestData".trim(), "ScenarioName", i)
							.contentEquals(StaticVariables.SCENARIO_NAME)) {
						testDataValue = excel.getCellData("TestData".trim(), TestDataName.trim(), i);
						dataFound = true;
						break;
					}
				}

				if (dataFound) {

					return testDataValue;
				} else {
					return null;
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.err.println("Excel/OR is not found");
				System.err.println(excelName);
			}
			return excelName;
		}
		

	}

	public String getValueFromPropertiesExcel(String sheetName, String dataName) {
		String excelName = StaticVariables.CURRENTUSERSHOMEDIR + "\\Properties\\" + "Properties" + ".xlsx";
		boolean dataFound = false;
		String Value_Retrieved = null;
		try {
			ExcelFunctions excel = new ExcelFunctions(excelName);

			for (int i = 2; i <= excel.getlastRowNumber(sheetName.trim()) + 2; i++) {
				if (excel.getCellData(sheetName.trim(), "Data", i).contentEquals(dataName.trim())) {
					Value_Retrieved = excel.getCellData(sheetName.trim(), "Value", i);
					dataFound = true;
					break;
				}
			}

			if (dataFound) {
				return Value_Retrieved;
			} else {
				return null;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println("Excel/OR is not found");
			System.err.println(excelName);
		}
		return excelName;

	}

	public Boolean setValuesToPropertiesExcel(String sheetName, String columnName, String Data_input,
			String dataToFill) {
		String excelName = StaticVariables.CURRENTUSERSHOMEDIR + "\\Properties\\" + "Properties" + ".xlsx";

		boolean dataFound = false;

		try {
			ExcelWriteFunctions excel = new ExcelWriteFunctions(excelName);
			ExcelFunctions Readexcel = new ExcelFunctions(excelName);
			for (int i = 2; i <= Readexcel.getlastRowNumber(sheetName) + 2; i++) {

				if (Readexcel.getCellData(sheetName.trim(), "Data", i).trim().contentEquals(Data_input)) {

					excel.setCellData(sheetName, columnName, i, dataToFill.trim());
					dataFound = true;
					break;
				}

			}

			if (dataFound) {
				return true;
			} else {
				return false;

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public Boolean getElement(String ObjectName, String pageName) throws InterruptedException {

		String objXPATH = getRelativeXPATH(ObjectName, pageName);
		System.out.println("XPATH is " + objXPATH);
		boolean elementFound = false;
		WebElement element = null;
		int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);
		// waitForelement(ObjectName, pageName);

		if (objXPATH != null) {
			int p = 1;
			while (p <= 4) {
				try {
					GetDrivers.Driver.manage().timeouts().implicitlyWait(maxWaitTime, TimeUnit.SECONDS);
					waitForelement(ObjectName, pageName);
					System.out.println(ObjectName + " wait successful");
					Actions action = new Actions(GetDrivers.Driver);
					element = GetDrivers.Driver.findElement(By.xpath(objXPATH));

					action.moveToElement(element).build().perform();

					p = 4;
					elementFound = true;

				} catch (StaleElementReferenceException e)

				{

					System.out.println("Stale Element Exception,Retrying to find the Element!!");

				}

				p = p + 1;
			}
			if (elementFound) {

				System.out.println("Element found!!");

				return elementFound;

			} else {
				return false;
			}

		} else {

			System.err.println("Object with relative XPATH-- " + objXPATH + " is not found!!!Please check again");
			return false;
		}

	}

	public WebElement waitForelement(String objName, String pageName) throws InterruptedException {
		int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);

		int i = 0;
		while (i < 4) {
			try {
				WebDriverWait wait = new WebDriverWait(GetDrivers.Driver, maxWaitTime);
				String objXPATH = getRelativeXPATH(objName, pageName);
				
				
				WebElement element = GetDrivers.Driver.findElement(By.xpath(objXPATH));
				Actions actions = new Actions(GetDrivers.Driver);
				
				
				
			
				wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(objXPATH)));
				
				//go to element using jscript
				
				actions.moveToElement(element);
				actions.build().perform();
				WebElement elementWait = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(objXPATH)));
				i = 4;
				return elementWait;
			} catch (StaleElementReferenceException e) {

				System.out.println("Stale Element Exception,Retrying to find the Element!!");

			}

			i = i + 1;
			// return null;
		}
		return null;

	}

	public void waitForelementtobeClickabe(String objName, String pageName) throws InterruptedException {
		int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);

		WebDriverWait wait = new WebDriverWait(GetDrivers.Driver, maxWaitTime);
		String objXPATH = getRelativeXPATH(objName, pageName);

		WebElement element = GetDrivers.Driver.findElement(By.xpath(objXPATH));
		Actions actions = new Actions(GetDrivers.Driver);

		actions.moveToElement(element);

		actions.build().perform();
		WebElement elementWait = wait.until(ExpectedConditions.elementToBeClickable(By.xpath(objXPATH)));

	}

	public String getElementText(String objName, String pageName) {

		String objXPATH = getRelativeXPATH(objName, pageName);
		{
			if (objXPATH != null) {

				String objText = GetDrivers.Driver.findElement(By.xpath(objXPATH)).getText().trim();
				return objText;

			} else {
				return null;
			}
		}

	}

	public static void takeScreenshot(WebDriver driver, long ms) {
		if (StaticVariables.SCREENSHOTS.equalsIgnoreCase("TRUE")) {
			if(StaticVariables.SHAREDRESULTS.equalsIgnoreCase("TRUE"))
			{
				
				int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);
				// waitForelement(ObjectName, pageName);
				GetDrivers.Driver.manage().timeouts().implicitlyWait(maxWaitTime, TimeUnit.SECONDS);
				try {
					
					TakesScreenshot ts = (TakesScreenshot) driver;

					File source = ts.getScreenshotAs(OutputType.FILE);
					
					File destinationPath = new File(
							StaticVariables.SHAREDPATH + "\\Automation\\Screenshots\\" + ms + ".jpg");
					FileUtils.copyFile(source, destinationPath);
					

					Reporter.addScreenCaptureFromPath(destinationPath.toString());
					byte[] screenshot = ((TakesScreenshot) GetDrivers.Driver).getScreenshotAs(OutputType.BYTES);
					StaticVariables.message.embed(screenshot, "image/png");

				} catch (Exception e) {
					System.out.println("Exception while taking ScreenShot " + e.getMessage());
				}
			}else
			{
			int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);
			// waitForelement(ObjectName, pageName);
			GetDrivers.Driver.manage().timeouts().implicitlyWait(maxWaitTime, TimeUnit.SECONDS);
			try {
				TakesScreenshot ts = (TakesScreenshot) driver;

				File source = ts.getScreenshotAs(OutputType.FILE);
				File destinationPath = new File(
						System.getProperty("user.dir") + "/target/cucumber-reports/ScreenShots/" + ms + ".jpg");
				
				File destinationPath1 = new File(
						System.getProperty("user.dir") + "/target/cucumber-reports/ScreenShots/"
							 +StaticVariables.message.getName()+"/" +System.currentTimeMillis()+ ".jpg");
				FileUtils.copyFile(source, destinationPath);
				FileUtils.copyFile(source, destinationPath1);
				Reporter.addScreenCaptureFromPath(destinationPath.toString());

			} catch (Exception e) {
				System.out.println("Exception while taking ScreenShot " + e.getMessage());
			}
			}
		}

	}

	private static void embed(byte[] screenshot, String string) {
		// TODO Auto-generated method stub
		
	}

	public boolean selectValueFromDropdownByText(String objName, String PageName, String value)
			throws InterruptedException {

		String objXPATH = getRelativeXPATH(objName, PageName);

		if (objXPATH != null) {
			WebElement element = GetDrivers.Driver.findElement(By.xpath(objXPATH));
			Select select = new Select(element);
			select.selectByVisibleText(value.trim());
			waitForelement(objName, PageName);
			if (select.getFirstSelectedOption().getText().trim().contentEquals(value.trim())) {
				return true;
			} else {

				return false;
			}
		} else {
			return false;
		}

	}

	public String getAttributeofElement(String objName, String PageName, String attributeName) {
		String objXPATH = getRelativeXPATH(objName, PageName);

		if (objXPATH != null) {
			WebElement element = GetDrivers.Driver.findElement(By.xpath(objXPATH));
			return element.getAttribute(attributeName).trim();
		} else {
			return null;
		}

	}

	public boolean retryingFindClick(WebElement element) throws InterruptedException {
		boolean result = false;
		int attempts = 0;
		while (attempts < 4) {
			try {
				element.click();
				result = true;
				break;
			} catch (StaleElementReferenceException e) {
				GetDrivers.Driver.navigate().refresh();
				int maxWaitTime = Integer.parseInt(StaticVariables.MAX_WAIT_TIME);
				GetDrivers.Driver.manage().timeouts().implicitlyWait(maxWaitTime, TimeUnit.SECONDS);
				Thread.sleep(3000);
				System.out.println("Stale Element");
			}

			attempts++;
		}
		return result;
	}

	public String createDynamicXPATHusingText(String text) {
		String xpathFormat = ".//*[text()='" + text + "']";
		return xpathFormat;
	}

	public void doubleClick(String objName, String pageName) throws InterruptedException {

		String objXPath = getRelativeXPATH(objName, pageName);
		getElement(objName, pageName);
		WebElement element = GetDrivers.Driver.findElement(By.xpath(objXPath));
		Actions actions = new Actions(GetDrivers.Driver);
		actions.moveToElement(element).build().perform();
		actions.doubleClick(element);
		actions.perform();

	}

	public void highlightElement(String objName, String pageName, String result) throws InterruptedException {
		if (StaticVariables.HIGHLIGHTS.equalsIgnoreCase("TRUE")) {

			waitForelement(objName, pageName);

			String objXpath = getRelativeXPATH(objName, pageName);
			WebElement element = GetDrivers.Driver.findElement(By.xpath(objXpath));

			JavascriptExecutor js = (JavascriptExecutor) GetDrivers.Driver;

			if (result.trim().equalsIgnoreCase("Pass")) {

				js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid green;');", element);
			} else if (result.trim().equalsIgnoreCase("Fail")) {
				js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
			} else {
				js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid blue;');", element);
			}
		}
	}

	public void clickElement(String objectName, String page) throws InterruptedException {
		
		boolean elementFound = getElement(objectName, page);
		String objXpath = getRelativeXPATH(objectName, page);
		WebElement element;
		
		Actions actions = new Actions(GetDrivers.Driver);
		if (elementFound) {
			element = GetDrivers.Driver.findElement(By.xpath(objXpath));
			waitForelementtobeClickabe(objectName, page);
			actions.moveToElement(element);

			actions.click().build().perform();

		} else {
			Assert.fail(objectName + " is not found!!");
		}
	}

	public void clearElement(String objectName, String page) throws InterruptedException {
		boolean elementFound = getElement(objectName, page);
		String objXpath = getRelativeXPATH(objectName, page);
		WebElement element;
		Actions actions = new Actions(GetDrivers.Driver);
		if (elementFound) {
			element = GetDrivers.Driver.findElement(By.xpath(objXpath));
			actions.moveToElement(element).perform();
			element.clear();

		}
	}

	public void enterTextinElement(String objectName, String page, String enteredText) throws InterruptedException {
		boolean elementFound = getElement(objectName, page);
		String objXpath = getRelativeXPATH(objectName, page);
		WebElement element;
		if (elementFound) {
			element = GetDrivers.Driver.findElement(By.xpath(objXpath));
			Actions action=new Actions(GetDrivers.Driver);
			action.moveToElement(element).build().perform();
		
			element.sendKeys(enteredText);
		}
	}

	public static String getHostName() {
		try {
			InetAddress myHost = InetAddress.getLocalHost();
			System.out.println(myHost.getHostName());
			return myHost.getHostName();
		} catch (UnknownHostException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public static void deleteDirectoryifPresent(String directory) throws IOException 
	{
		
		 File file = new File(directory);

	        if (file.exists()) {
	        	FileUtils.deleteDirectory(new File(directory));
	            System.out.println("Directory is deleted");
	        } else {
	            System.out.println("Directory is not present!");
	        }
	}
	
	
	public static boolean checkdictoryPresent(String directory)
	{
		File file = new File(directory);

        if (!file.exists()) {
        	return true;
           
        } else {
        	return false;
           
        }
	}
	
	public static void createDirectoryifPresent(String directory)
	{
		File file = new File(directory);

        if (!file.exists()) {
        	file.mkdir();
        	System.out.println("File created");
        	
           
        } else {
        	System.out.println("File already created");
           
        }
	}
	
	public static void deleteFileifPresent(String directory)
	{
		File file = new File(directory);

        if (file.exists()) {
        	file.delete();
            System.out.println("File is deleted");
        } else {
            System.out.println("File is not present!");
        }
	}
	
	
	public static void copyReport() throws IOException
	{
		File source = new File(StaticVariables.CURRENTUSERSHOMEDIR+"\\target\\cucumber-reports\\"+"report.html");
		File destinationPath = new File(
				StaticVariables.SHAREDPATH + "\\Automation\\"+"report.html");
		FileUtils.copyFile(source, destinationPath);
	}
	
	public static void copyFile(String sourceFile,String destinationFile)
	{
		File source = new File(sourceFile);
		File destinationPath = new File(
				destinationFile);
		try {
			FileUtils.copyFile(source, destinationPath);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void createExcel() throws IOException {
		String[] columns = {"Test name","Application","Status","Attachment"};
		XSSFWorkbook wb =new XSSFWorkbook();
		XSSFSheet sheet=wb.createSheet("Scenario");
		Font headerFont = wb.createFont();
		headerFont.setBold(true);
		CellStyle headerCellStyle= wb.createCellStyle();
		headerCellStyle.setFont(headerFont);
		
		Row headerRow = sheet.createRow(0);
		for(int i=0; i< columns.length;i++)
		{
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(columns[i]);
			cell.setCellStyle(headerCellStyle);
		}
		new File("target\\cucumber-reports\\").mkdirs();
		FileOutputStream fileOut = new FileOutputStream("target\\cucumber-reports\\Testcase details.xlsx");
		
		wb.write(fileOut);
		fileOut.close();
		wb.close();
	}
	
	public static void updateExcel(Scenario scenario, String zipfilepath) throws Exception {
		// TODO Auto-generated method stub
		FileInputStream fis = new FileInputStream("target\\cucumber-reports\\Testcase details.xlsx");
		XSSFWorkbook wb =new XSSFWorkbook(fis);
		XSSFSheet sheet=wb.getSheet("Scenario");
		
		int lastrow=sheet.getLastRowNum()+1;
		Row normal=sheet.createRow(lastrow);
		if(scenario.isFailed())
		{
			 String[] TCDetails= {scenario.getName(),"CHS","Failed",zipfilepath};
			 for(int j=0; j<TCDetails.length;j++)
				{
					Cell cell = normal.createCell(j);
					cell.setCellValue(TCDetails[j]);
				}
		}
		if(!(scenario.isFailed()) && StaticVariables.SCREENSHOTS.equalsIgnoreCase("TRUE") ) {
			String[] TCDetails= {scenario.getName(),"CHS","Passed",zipfilepath};
			for(int j=0; j<TCDetails.length;j++)
			{
				Cell cell = normal.createCell(j);
				cell.setCellValue(TCDetails[j]);
			}
		}
		
		if(!(scenario.isFailed()) && StaticVariables.SCREENSHOTS.equalsIgnoreCase("False") ) {
			String[] TCDetails= {scenario.getName(),"CHS","Passed","NA"};
			for(int j=0; j<TCDetails.length;j++)
			{
				Cell cell = normal.createCell(j);
				cell.setCellValue(TCDetails[j]);
			}
		}
		
		//new File("target\\cucumber-report\\").mkdirs();
		FileOutputStream fileOut = new FileOutputStream("target\\cucumber-reports\\Testcase details.xlsx");

		wb.write(fileOut);
		fis.close();
		fileOut.close();
		wb.close();
		
	}
	
	public static void zipMethod(String sourcedir, String destinationzip)
	{
		String zipfile = destinationzip;
		String srcDir = sourcedir;
		
		try{
			byte[] buffer = new byte[1024];
			FileOutputStream fos = new FileOutputStream(zipfile);
			ZipOutputStream zos= new ZipOutputStream(fos);
			
			File dir = new File(srcDir);
			File[] files = dir.listFiles();
			for (int i=0;i<files.length;i++) {
				System.out.println("Adding file: " + files[i].getName());
				FileInputStream fis = new FileInputStream(files[i]);
				zos.putNextEntry(new ZipEntry(files[i].getName()));
				int length;
				while((length=fis.read(buffer))>0){
					zos.write(buffer,0,length);
				}
				zos.closeEntry();
				fis.close();
			}
			zos.close();
		}
		catch(IOException ioe) {
			System.out.println("Error creating zip file" + ioe);
		}
	}
	
}
