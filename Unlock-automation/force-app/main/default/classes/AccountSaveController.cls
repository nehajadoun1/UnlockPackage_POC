public class AccountSaveController {
	public Account actObj{get;set;}
    public Opportunity oppObj{get;set;}
    public Contact contactObj{get;set;}
	public AccountSaveController(){
		actObj = new Account();
        oppObj = new Opportunity();
        contactObj = new Contact();
    }	
	public pagereference actSave(){
		insert actObj;
        oppObj.AccountId = actObj.Id;
        contactObj.AccountId = actObj.Id;
        insert contactObj;
        insert oppObj;
		return new pagereference('/'+actObj.Id);	
	}
}