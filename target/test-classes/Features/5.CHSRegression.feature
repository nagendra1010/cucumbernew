@CHSRegression
Feature: Validate all functionalities in the CHS application

@Regression_RegisterSmallYES
Scenario: Verify registration of Small Yes

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
When the user enters "Address" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
Then the "Searched Address" with text "Address" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Searched Address" button
|PageName|
|Addresses|
Then the "Address Page" with text "Address" should be displayed
|PageName|
|Addresses|
And the value of "Installation Address" should be "Address"
|PageName|
|Addresses|
And the "Primary Contact" with text "ContactName" should be displayed
|PageName|
|Addresses|

When the user clicks on the "Cases" button
|PageName|
|HomePage|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
When the user clicks on the "New Case" button
|PageName|
|Cases|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
When the user enters "Address" in the "Adresse" Itextbox
|PageName|
|Cases|
And the user allows "1" seconds to load the "Adresse Searched Result"
Then the user clicks on the "Adresse Searched Result" Ibutton
|PageName|
|Cases|
When the user enters "ContactName" in the "Contact" textbox
|PageName|
|Contacts|

#When the user enters "ContactName" in the "Contact" textbox and then clicks on the "Search" button
#|PageName|
#|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Contact Searched Result" button
|PageName|
|Contacts|
#When the user enters "DepartmentName" in the "Department" textbox
#|PageName|
#|Contacts|
When the user enters "DepartmentName" in the "Department" textbox and then clicks on the "Search" button
|PageName|
|Contacts|
And the user again clicks on "Search" if "Department Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Department Searched Result" button
|PageName|
|Contacts|
#When the user enters "Kundeservice Subject Name" in the "Subject" textbox
#|PageName|
#|Contacts|
When the user enters "Kundeservice Subject Name" in the "Subject" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Subject Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Subject Searched Result" button
|PageName|
|Contacts|
And the user enters "-Register Small Yes" in the "Description" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
And the "General Information Contact Name" with text "ContactName" should be displayed
|PageName|
|Cases|
And the user allows "2" seconds to load the "Result"
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Case Number Generated|Cases|Value|
And the user allows "3" seconds to load the "Result"
When the user clicks on the "Address Information" button
|PageName|
|Cases|
Then the "Fibernet Availability" with text "-Fiber possible" should be displayed
|PageName|
|Cases|
#And the "Wish list registered" with text "-No" should be displayed
#|PageName|
#|Cases|
#And the "Small yes registered" with text "-No" should be displayed
#|PageName|
#|Cases|
When the user clicks on the "Register Small Yes Button" button
|PageName|
|Cases|
Then the "Registration send to Agilic" should be displayed
|PageName|
|Cases|
#When the user navigates to the "HCPORTAL" in a separate browser window
#And the user enters "HCPORTAL UserName" and "HCPORTAL Password"
#|PageName|
#|Cases|
#When the user clicks on the "Agillic Login" button
#|PageName|
#|Cases|


@Regression_RegisterWishList
Scenario:Verify Sign Up for Wishlist

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
When the user enters "Address" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
Then the "Searched Address" with text "Address" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Searched Address" button
|PageName|
|Addresses|
Then the "Address Page" with text "Address" should be displayed
|PageName|
|Addresses|
And the value of "Installation Address" should be "Address"
|PageName|
|Addresses|
And the "Primary Contact" with text "ContactName" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Cases" button
|PageName|
|HomePage|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
When the user clicks on the "New Case" button
|PageName|
|Cases|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
When the user enters "Address" in the "Adresse" Itextbox
|PageName|
|Cases|
And the user allows "1" seconds to load the "Adresse Searched Result"
Then the user clicks on the "Adresse Searched Result" Ibutton
|PageName|
|Cases|
When the user enters "ContactName" in the "Contact" textbox
|PageName|
|Contacts|

#When the user enters "ContactName" in the "Contact" textbox and then clicks on the "Search" button
#|PageName|
#|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Contact Searched Result" button
|PageName|
|Contacts|
When the user enters "DepartmentName" in the "Department" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Department Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Department Searched Result" button
|PageName|
|Contacts|
#When the user enters "Kundeservice Subject Name" in the "Subject" textbox
#|PageName|
#|Contacts|
When the user enters "Kundeservice Subject Name" in the "Subject" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Subject Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"

Then the user clicks on the "Subject Searched Result" button
|PageName|
|Contacts|
And the user enters "-Register WishList" in the "Description" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
And the "General Information Contact Name" with text "ContactName" should be displayed
|PageName|
|Cases|
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Case Number Generated|Cases|Value|
And the user allows "3" seconds to load the "Result"
When the user clicks on the "Address Information" button
|PageName|
|Cases|
Then the "WishList Fibernet Availability" with text "-Fiber not possible" should be displayed
|PageName|
|Cases|
#And the "Wish list registered" with text "-No" should be displayed
#|PageName|
#|Cases|
#And the "Small yes registered" with text "-No" should be displayed
#|PageName|
#|Cases|
When the user clicks on the "Sign up- Interesseliste" button
|PageName|
|Cases|
Then the "Registration send to Agilic" should be displayed
|PageName|
|Cases|
#When the user navigates to the "HCPORTAL" in a separate browser window
#And the user enters "HCPORTAL UserName" and "HCPORTAL Password"
#|PageName|
#|Cases|
#When the user clicks on the "Agillic Login" button
#|PageName|
#|Cases|


@Regression_Case_ResoveDirectly
Scenario: Verify whether Cases can be created and resolved directly
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
When the user clicks on the "Create A New Record" button
|PageName|
|HomePage|
And the user clicks on the "Case Record" button
|PageName|
|HomePage|
Then the "Quick Create:Case" should be displayed
|PageName|
|HomePage|
When the user enters "CustomerName" in the "Customer" textbox
|PageName|
|HomePage|
And the user allows "5" seconds to load the "Quick Create Customer Searched Result"
Then the user clicks on the "Quick Create Customer Searched Result" button
|PageName|
|HomePage|
When the user enters "DepartmentName" in the "Department" textbox
|PageName|
|HomePage|
And the user allows "2" seconds to load the "Quick Create Department Searched Result"
Then the user clicks on the "Quick Create Department Searched Result" button
|PageName|
|HomePage|
When the user enters "Kundeservice Subject Name" in the "Kundeservice Subject" textbox
|PageName|
|HomePage|
And the user allows "2" seconds to load the "Quick Create Kundeservice Subject Searched Result"
Then the user clicks on the "Quick Create Kundeservice Subject Searched Result" button
|PageName|
|HomePage|
And changes the value of "Is Case Resolved?" to "Yes"
|PageName|
|HomePage|

When the user clicks on the "Save and Close" button
|PageName|
|HomePage|
And the user clicks on the "View Record" button
|PageName|
|HomePage|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
And the "Case Status" with text "-Problem Solved" should be displayed
|PageName|
|Cases|

#-----------------------------

@Regression_ChangeContactDetails
Scenario: Verify whether Contact Details can be changed successfully

#		CHANGE FROM ABINASH TO SUBHOJIT
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
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Contact Last Name|Contacts|Value|
|Contact Phone Number|Contacts|Value|
|Contact Email Address|Contacts|Value|
When the user clicks on the "Cases" button
|PageName|
|Cases|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
When the user clicks on the "New Case" button
|PageName|
|Cases|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
And changes the value of "Address available" to "No"
|PageName|
|Cases|
When the user enters "ContactName" in the "Contact" textbox
|PageName|
|Contacts|
#When the user enters "ContactName" in the "Contact" textbox and then clicks on the "Search" button
#|PageName|
#|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"

Then the user clicks on the "Contact Searched Result" button
|PageName|
|Contacts|
Then the "Contact Name" with text "Noted_Contact Last Name" should be displayed
|PageName|
|Contacts|
#When the user enters "DepartmentName" in the "Department" textbox
#|PageName|
#|Contacts|
When the user enters "DepartmentName" in the "Department" textbox and then clicks on the "Search" button
|PageName|
|Contacts|
And the user again clicks on "Search" if "Department Searched Result" is not visible
|PageName|
|Contacts|

And the user allows "2" seconds to load the "Contact Searched Result"

Then the user clicks on the "Department Searched Result" button
|PageName|
|Contacts|

When the user enters "Kundeservice Subject Name" in the "Subject" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Subject Searched Result" is not visible
|PageName|
|Contacts|

And the user allows "2" seconds to load the "Contact Searched Result"

Then the user clicks on the "Subject Searched Result" button
|PageName|
|Contacts|
And the user enters "-Change Contact Details" in the "Description" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
Then the "Contact Name--Change Details options" should be displayed
|PageName|
|Contacts|
When the user enters "NewContactName" in the "Contact Name--Change Details" textbox
|PageName|
|Contacts|
And the user enters "NewContactEmail" in the "Contact Email--Change Details" textbox
|PageName|
|Contacts|

And the user enters "NewContactPhoneNumber" in the "Contact Phone--Change Details" textbox
|PageName|
|Contacts|
Then the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Contact Name--Change Details|Contacts|Value|
|Contact Email--Change Details|Contacts|Value|
|Contact Phone--Change Details|Contacts|Value|
When the user clicks on the "Save" button
|PageName|
|Contacts|
Then the "Change Customerdata button" should be displayed
|PageName|
|Contacts|
When the user clicks on the "Change Customerdata button" button
|PageName|
|Contacts|
Then the "Change send to Agilic message" should be displayed
|PageName|
|Contacts|


And the user clicks on the "Case Refresh" till the "General Information Contact Name" matches with "NewContactName"
|PageName|Identification|MaximumTimeOut|
|Cases|Text|200|

Then the "General Information Contact Name" should match with "Contact Name--Change Details"
|PageName|Identification|
|Cases|Text|
And the "General Information Contact Email" should match with "Contact Email--Change Details"
|PageName|Identification|
|Cases|Value|
And the "General Information Contact Phone" should match with "Contact Phone--Change Details"
|PageName|Identification|
|Cases|Value|


#       CLEARING OF DATA FOR REUSE
#		CHANGE AGAIN FROM SUBHOJIT TO ABINASH

When the user clicks on the "Contacts" button
|PageName|
|Contacts|
Then the "Contacts Page" should be displayed
|PageName|
|Contacts|
When the user enters "NewContactName" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|

When the user clicks on the link text "NewContactName"

Then the "Searched Data Page" with text "NewContactName" should be displayed
|PageName|
|Contacts|

When the user clicks on the "Cases" button
|PageName|
|Cases|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
When the user clicks on the "New Case" button
|PageName|
|Cases|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
And changes the value of "Address available" to "No"
|PageName|
|Cases|
When the user enters "NewContactName" in the "Contact" textbox
|PageName|
|Contacts|
#When the user enters "NewContactName" in the "Contact" textbox and then clicks on the "Search" button
#|PageName|
#|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Contact Searched Result" button
|PageName|
|Contacts|
Then the "Contact Name" with text "NewContactName" should be displayed
|PageName|
|Contacts|

#When the user enters "DepartmentName" in the "Department" textbox
#|PageName|
#|Contacts|
When the user enters "DepartmentName" in the "Department" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Department Searched Result" is not visible
|PageName|
|Contacts|


And the user allows "2" seconds to load the "Contact Searched Result"

Then the user clicks on the "Department Searched Result" button
|PageName|
|Contacts|

When the user enters "Kundeservice Subject Name" in the "Subject" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Subject Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Subject Searched Result"

Then the user clicks on the "Subject Searched Result" button
|PageName|
|Contacts|
And the user enters "-Change Contact Details" in the "Description" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
Then the "Contact Name--Change Details options" should be displayed
|PageName|
|Contacts|
When the user enters "Noted_Contact Last Name" in the "Contact Name--Change Details" textbox
|PageName|
|Contacts|
And the user enters "Noted_Contact Email Address" in the "Contact Email--Change Details" textbox
|PageName|
|Contacts|


And the user enters "Noted_Contact Phone Number" in the "Contact Phone--Change Details" textbox
|PageName|
|Contacts|

When the user clicks on the "Save" button
|PageName|
|Contacts|
Then the "Change Customerdata button" should be displayed
|PageName|
|Contacts|
When the user clicks on the "Change Customerdata button" button
|PageName|
|Contacts|
Then the "Change send to Agilic message" should be displayed
|PageName|
|Contacts|

@Regression_DuplicateContact
Scenario: Verify whether appropiate error messages are displayed during creation of duplicate contact
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
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|DuplicateContact_Original Contact First Name|Contacts|Value|
|DuplicateContact_Original Contact Last Name|Contacts|Value|
|DuplicateContact_Original Contact Email|Contacts|Value|
|DuplicateContact_Original Contact Phone Number|Contacts|Value|
When the user clicks on the "Contacts" button
|PageName|
|Contacts|
Then the "Contacts Page" should be displayed
|PageName|
|Contacts|
And the user clicks on the "New" button
|PageName|
|Contacts|
Then the "New Contact Page" should be displayed
|PageName|
|Contacts|
When the user enters "Noted_DuplicateContact_Original Contact First Name" in the "Contact First Name" textbox
|PageName|
|Contacts|
And the user enters "Noted_DuplicateContact_Original Contact Last Name" in the "Contact Last Name" textbox
|PageName|
|Contacts|
And the user enters "Noted_DuplicateContact_Original Contact Phone Number" in the "Contact Phone Number" textbox
|PageName|
|Contacts|
And the user enters "Noted_DuplicateContact_Original Contact Email" in the "Contact Email Address" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
Then the "Duplicate Records Detected" should be displayed
|PageName|
|Contacts|
And the "Duplicate Record Statement" with text "-This record might be a duplicate of one of the records below. Would you like to save it anyway?" should be displayed
|PageName|
|Contacts|
When the user clicks on the "Cancel" button
|PageName|
|Contacts|
Then the "New Contact Page" should be displayed
|PageName|
|Contacts|
When the user clicks on the "New" button
|PageName|
|Contacts|
When the user clicks on the "Discard changes" button
|PageName|
|Contacts|

And the user enters "Noted_DuplicateContact_Original Contact First Name" in the "Contact First Name" textbox
|PageName|
|Contacts|
And the user enters "Noted_DuplicateContact_Original Contact Last Name" in the "Contact Last Name" textbox
|PageName|
|Contacts|
And the user enters "Noted_DuplicateContact_Original Contact Phone Number" in the "Contact Phone Number" textbox
|PageName|
|Contacts|
And the user enters "-subsa@nuuday.dk" in the "Contact Email Address" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
Then the "Duplicate Records Detected" should be displayed
|PageName|
|Contacts|
And the "Duplicate Record Statement" with text "-This record might be a duplicate of one of the records below. Would you like to save it anyway?" should be displayed
|PageName|
|Contacts|
When the user clicks on the "Cancel" button
|PageName|
|Contacts|
Then the "New Contact Page" should be displayed
|PageName|
|Contacts|
When the user clicks on the "New" button
|PageName|
|Contacts|
When the user clicks on the "Discard changes" button
|PageName|
|Contacts|

And the user enters "Noted_DuplicateContact_Original Contact First Name" in the "Contact First Name" textbox
|PageName|
|Contacts|
And the user enters "Noted_DuplicateContact_Original Contact Last Name" in the "Contact Last Name" textbox
|PageName|
|Contacts|
And the user enters "-98743568" in the "Contact Phone Number" textbox
|PageName|
|Contacts|
And the user enters "Noted_DuplicateContact_Original Contact Email" in the "Contact Email Address" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
Then the "Duplicate Records Detected" should be displayed
|PageName|
|Contacts|
And the "Duplicate Record Statement" with text "-This record might be a duplicate of one of the records below. Would you like to save it anyway?" should be displayed
|PageName|
|Contacts|
When the user clicks on the "Cancel" button
|PageName|
|Contacts|
Then the "New Contact Page" should be displayed
|PageName|
|Contacts|

#--------------------------------------------------------

@Regression_AddressWithLID
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


@Regression_AccountByName
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


@Regression_SearchCaseByContact
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
And the user allows "2" seconds to load the "First Searched Case Number"
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

@Regression_SearchContactByName
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

@Regression_SearchAddressByContact
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

#--------------------------------------------------------------------------------------


@Regression_CancellationofSmallYES
Scenario: Verify Cancellation of Small Yes
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
When the user enters "Address" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
Then the "Searched Address" with text "Address" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Searched Address" button
|PageName|
|Addresses|
Then the "Address Page" with text "Address" should be displayed
|PageName|
|Addresses|
And the value of "Installation Address" should be "Address"
|PageName|
|Addresses|
And the "Primary Contact" with text "ContactName" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Cases" button
|PageName|
|HomePage|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
When the user clicks on the "New Case" button
|PageName|
|Cases|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
When the user enters "Address" in the "Adresse" Itextbox
|PageName|
|Cases|
And the user allows "1" seconds to load the "Adresse Searched Result"
Then the user clicks on the "Adresse Searched Result" Ibutton
|PageName|
|Cases|
When the user enters "ContactName" in the "Contact" textbox
|PageName|
|Contacts|

#When the user enters "ContactName" in the "Contact" textbox and then clicks on the "Search" button
#|PageName|
#|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Contact Searched Result" button
|PageName|
|Contacts|
When the user enters "DepartmentName" in the "Department" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Department Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Department Searched Result" button
|PageName|
|Contacts|
#When the user enters "Kundeservice Subject Name" in the "Subject" textbox
#|PageName|
#|Contacts|
When the user enters "Kundeservice Subject Name" in the "Subject" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Subject Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Subject Searched Result" button
|PageName|
|Contacts|
And the user enters "-Cancel Small yes" in the "Description" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
And the "General Information Contact Name" with text "ContactName" should be displayed
|PageName|
|Cases|
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Case Number Generated|Cases|Value|
And the user allows "3" seconds to load the "Result"
When the user clicks on the "Address Information" button
|PageName|
|Cases|
Then the "Fibernet Availability" with text "-Fiber possible" should be displayed
|PageName|
|Cases|
And the "Small yes registered" with text "-Yes" should be displayed
|PageName|
|Cases|
When the user clicks on the "Cancel Small Yes Button" button
|PageName|
|Cases|
Then the "Cancelation send to Agilic" should be displayed
|PageName|
|Cases|

#When the user navigates to the "HCPORTAL" in a separate browser window
#And the user enters "HCPORTAL UserName" and "HCPORTAL Password"
#|PageName|
#|Cases|
#When the user clicks on the "Agillic Login" button
#|PageName|
#|Cases|

@Regression_CancellationofWishList
Scenario: Verify the Cancellation of Registered WishList
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
When the user enters "Address" in the "Search this View" textbox
|PageName|
|Addresses|
And the user clicks on the "Search" button
|PageName|
|Addresses|
Then the "Searched Address" with text "Address" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Searched Address" button
|PageName|
|Addresses|
Then the "Address Page" with text "Address" should be displayed
|PageName|
|Addresses|
And the value of "Installation Address" should be "Address"
|PageName|
|Addresses|
And the "Primary Contact" with text "ContactName" should be displayed
|PageName|
|Addresses|
When the user clicks on the "Cases" button
|PageName|
|HomePage|
Then the "Cases Page" should be displayed
|PageName|
|Cases|
When the user clicks on the "New Case" button
|PageName|
|Cases|
Then the "New Case Page" should be displayed
|PageName|
|Cases|
When the user enters "Address" in the "Adresse" Itextbox
|PageName|
|Cases|
And the user allows "1" seconds to load the "Adresse Searched Result"
Then the user clicks on the "Adresse Searched Result" Ibutton
|PageName|
|Cases|
When the user enters "ContactName" in the "Contact" textbox
|PageName|
|Contacts|

#When the user enters "ContactName" in the "Contact" textbox and then clicks on the "Search" button
#|PageName|
#|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Contact Searched Result" button
|PageName|
|Contacts|

When the user enters "DepartmentName" in the "Department" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Department Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Department Searched Result" button
|PageName|
|Contacts|
#When the user enters "Kundeservice Subject Name" in the "Subject" textbox
#|PageName|
#|Contacts|
When the user enters "Kundeservice Subject Name" in the "Subject" textbox and then clicks on the "Search" button
|PageName|
|Contacts|

And the user again clicks on "Search" if "Subject Searched Result" is not visible
|PageName|
|Contacts|
And the user allows "2" seconds to load the "Contact Searched Result"
Then the user clicks on the "Subject Searched Result" button
|PageName|
|Contacts|
And the user enters "-Cancel Wish List" in the "Description" textbox
|PageName|
|Contacts|
When the user clicks on the "Save" button
|PageName|
|Contacts|
And the "General Information Contact Name" with text "ContactName" should be displayed
|PageName|
|Cases|
And the user notes the below mention fields for further evaluation
|Fields|PageName|Identifier|
|Case Number Generated|Cases|Value|
And the user allows "3" seconds to load the "Result"
When the user clicks on the "Address Information" button
|PageName|
|Cases|
Then the "WishList Fibernet Availability" with text "-Fiber not possible" should be displayed
|PageName|
|Cases|
And the "Wish list registered" with text "-Yes" should be displayed
|PageName|
|Cases|
#And the "Small yes registered" with text "-Yes" should be displayed
#|PageName|
#|Cases|
When the user clicks on the "Cancel WishList" button
|PageName|
|Cases|
Then the "Cancelation send to Agilic" should be displayed
|PageName|
|Cases|
#-------------------------------------------------------------------------
