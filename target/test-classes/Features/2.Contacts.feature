@FeaturesRelatedToContact
Feature: Verify all features related to Contact

@ChangeContactDetails
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

@DuplicateContactValidation
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

@ChangetheContactwithoutCleanup
Scenario: Change Contact without cleanup


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


@TestingCODE
Scenario: Testing the code lets see
And the user again clicks on "Department Searched Result" if "searchedResult" is not visible
|PageName|
|Contacts|