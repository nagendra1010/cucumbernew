@CreationofCases
Feature: Create Cases

@RegisterSmallYES
Scenario:Verify registration of Small Yes

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


@RegisterWishList
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

@CreateCaseandResoveDirectly
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


