@isTest
private class TestAccountSaveController {
    testmethod static void testactSave(){
        Account actObj = new Account();
        actObj.Name = 'Salesforce Techbook';
        Opportunity oppObj = new Opportunity();
        oppObj.Name = 'Test Opp';
        oppObj.StageName = 'Prospecting';
        oppObj.CloseDate = System.today();
        Contact contObj = new Contact();
        contObj.LastName ='Test Last Name';
        contObj.FirstName ='Test First Name';
        Test.startTest();
            AccountSaveController actSaveControllerObj = new AccountSaveController();
            actSaveControllerObj.actObj = actObj;
            actSaveControllerObj.contactObj = contObj;
            actSaveControllerObj.oppObj = oppObj;        
            actSaveControllerObj.actSave();
        Test.stopTest();
    }
}