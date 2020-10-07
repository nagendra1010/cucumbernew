@SearchFunctionality
Feature: Validate various Search functioinality in the CHS application

@SearchAddressWithLID
Scenario: Verify Address searched with LID is displayed properly
Given the user is on the login page of "Case Handling System" application
|PageName|
|Login|
When the user enters "UserName" in the "Microsoft UserName" textbox
|PageName|
|Login|
When the user clicks on the "Microsoft Next" button
|PageName|
|Login|
Then the "CHS Homepage" should be displayed
|PageName|
|HomePage|
When the user clicks on the "Addresses" button
|PageName|
|HomePage|
Then the "Aktive Adresser Page" should be displayed
|PageName|
|Addresses|
When the user enters "LID" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
Then the "Searched Address" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Searched Address" button
|PageName|
|Addresses|
Then the "Address Page" should be displayed
|PageName|
|Addresses|
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Address Page|Addresses|Text|
When the user clicks on the "Global Search button" button
|PageName|
|HomePage|
And the user enters "LID" in the "Search Dynamics 365 Data" textbox
|PageName|
|HomePage|
When the user clicks on the "Search Dynamics 365 Data icon" button
|PageName|
|HomePage|

When the user clicks on the link text "Noted_Address Page"
Then the "Address Page" should match with "Address Page"
|PageName|Identification|
|Addresses|Text|



@SearchAccountByName
Scenario: Verify whether an Account Name can be searched in the CHS Application
Given the user is on the login page of "Case Handling System" application
|PageName|
|Login|
When the user enters "UserName" in the "Microsoft UserName" textbox
|PageName|
|Login|
When the user clicks on the "Microsoft Next" button
|PageName|
|Login|
Then the "CHS Homepage" should be displayed
|PageName|
|HomePage|
When the user clicks on the "Accounts" button
|PageName|
|HomePage|
Then the "Accounts Page" should be displayed
|PageName|
|Accounts|
When the user enters "AccountName" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
Then the "Searched Account" should be displayed
|PageName|
|Accounts|


When the user clicks on the link text "AccountName"
#When the user clicks on the "Searched Account" button
#|PageName|
#|Accounts|
Then the "Accounts Header" with text "AccountName" should be displayed
|PageName|
|Accounts|


@SearchCaseByContact
Scenario: Validate whether Cases can be searched by Contact Name
Given the user is on the login page of "Case Handling System" application
|PageName|
|Login|
When the user enters "UserName" in the "Microsoft UserName" textbox
|PageName|
|Login|
And the user clicks on the "Microsoft Next" button
|PageName|
|Login|
Then the "CHS Homepage" should be displayed
|PageName|
|HomePage|
When the user clicks on the "Cases" button
|PageName|
|HomePage|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
#When the user clicks on the "Cases Listbox" button
#|PageName|
#|Cases|
#And the user clicks on the "Alle sager" button
#|PageName|
#|Cases|
#Then the "Cases Page" should be displayed
#|PageName|
#|Cases|
When the user enters "ContactName" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
And the user allows "3" seconds to load the "First Searched Case Number"
Then the "First Searched Case Number" should be displayed
|PageName|
|Cases|

When the user  double clicks on the "First Searched Case Number" button
|PageName|
|Cases|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
And the "General Information Contact Name" with text "ContactName" should be displayed
|PageName|
|Cases|

@SearchContactByName
Scenario: Validate whether a ContactName can be searched in the CHS application

Given the user is on the login page of "Case Handling System" application
|PageName|
|Login|
When the user enters "UserName" in the "Microsoft UserName" textbox
|PageName|
|Login|
And the user clicks on the "Microsoft Next" button
|PageName|
|Login|
Then the "CHS Homepage" should be displayed
|PageName|
|HomePage|
When the user clicks on the "Contacts" button
|PageName|
|Contacts|
Then the "Contacts Page" should be displayed
|PageName|
|Contacts|
When the user enters "ContactName" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|

When the user clicks on the link text "ContactName"

Then the "Searched Data Page" with text "ContactName" should be displayed
|PageName|
|Contacts|
When the user clicks on the "Global Search button" button
|PageName|
|HomePage|
And the user enters "ContactName" in the "Search Dynamics 365 Data" textbox
|PageName|
|HomePage|
When the user clicks on the "Search Dynamics 365 Data icon" button
|PageName|
|HomePage|
Then the "Global Searched Contact Data" with text "ContactName" should be displayed
|PageName|
|HomePage|

@SearchAddressByContact
Scenario: Verify whether an address can be searched from ContactName in the CHS Application
Given the user is on the login page of "Case Handling System" application
|PageName|
|Login|
When the user enters "UserName" in the "Microsoft UserName" textbox
|PageName|
|Login|
And the user clicks on the "Microsoft Next" button
|PageName|
|Login|
Then the "CHS Homepage" should be displayed
|PageName|
|HomePage|
When the user clicks on the "Addresses" button
|PageName|
|HomePage|
Then the "Aktive Adresser Page" should be displayed
|PageName|
|Addresses|
When the user enters "ContactName" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
When the user clicks on the "Searched Address" button
|PageName|
|Addresses|
Then the "Address Page" should be displayed
|PageName|
|Addresses|
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Address Page|Addresses|Text|
When the user clicks on the "Global Search button" button
|PageName|
|HomePage|
And the user enters "ContactName" in the "Search Dynamics 365 Data" textbox
|PageName|
|HomePage|
When the user clicks on the "Search Dynamics 365 Data icon" button
|PageName|
|HomePage|
When the user clicks on the link text "Noted_Address Page"
Then the "Address Page" should match with "Address Page"
|PageName|Identification|
|Addresses|Text|

@SearchCaseByContactusingWrongData
Scenario: Validate whether Cases can be searched by wrong Contact Name
Given the user is on the login page of "Case Handling System" application
|PageName|
|Login|
When the user enters "UserName" in the "Microsoft UserName" textbox
|PageName|
|Login|
And the user clicks on the "Microsoft Next" button
|PageName|
|Login|
Then the "CHS Homepage" should be displayed
|PageName|
|HomePage|
When the user clicks on the "Cases" button
|PageName|
|HomePage|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
When the user enters "ContactName" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
And the user allows "2" seconds to load the "First Searched Case Number"
Then the "First Searched Case Number" should be displayed
|PageName|
|Cases|



