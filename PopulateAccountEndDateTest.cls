@isTest
public class PopulateAccountEndDateTest {
    /*    
    (1) Start_Date = 01/Feb/2022 and Number_of_Days__c = 10; then End_Date = 14/Feb/2022
    (2) Start_Date = 01/Feb/2022 and Number_of_Days__c = 01; then End_Date = 01/Feb/2022
    (3) Start_Date = 01/Feb/2022 and Number_of_Days__c = 0; then End_Date = 01/Feb/2022
    (4) Start_Date = 01/Feb/2022 and Number_of_Days__c = null; then End_Date = 01/Feb/2022
    (5) Start_Date = 01/Feb/2022 and Number_of_Days__c = 3; then End_Date = 03/Feb/2022
    (6) Start_Date = 01/Feb/2022 and Number_of_Days__c = 5; then End_Date = 07/Feb/2022
    */
    
     @testSetup static void setup() {
        // Create common test accounts
        List<Account> testAccts = new List<Account>();
        for(Integer i=0;i<7;i++) {
            testAccts.add(new Account(Name = 'TestAcct'+i));
        }
        insert testAccts;        
    }
    
   
    @istest 
    static void whenNumberofDaysIsTen(){
        
        Account acc = [SELECT Id, start_date__c, end_date__c, number_of_days__c
                      FROM Account WHERE Name = 'TestAcct1'];

        acc.start_date__c = date.newInstance(2022, 2, 1);
        acc.Number_of_Days__c = 10;
        update acc;
        
        List<Id> ids = new List<Id>();
        Id myId = acc.Id;
        ids.add(myId);
        List<Date> endDates = PopulateAccountEndDate.addNumberOfDays(ids);        
        
        system.assertEquals('2/14/2022', endDates[0].format());
    }
    
    @istest 
    static void whenNumberofDaysIsOne(){
        
        Account acc = [SELECT Id, start_date__c, end_date__c, number_of_days__c
                      FROM Account WHERE Name = 'TestAcct2'];

        acc.start_date__c = date.newInstance(2022, 2, 1);
        acc.Number_of_Days__c = 01;
        update acc;
        
        List<Id> ids = new List<Id>();
        Id myId = acc.Id;
        ids.add(myId);
        List<Date> endDates = PopulateAccountEndDate.addNumberOfDays(ids);        
        
        system.assertEquals('2/1/2022', endDates[0].format());
    }
    
      @istest 
    static void whenNumberofDaysIsZero(){
        
        Account acc = [SELECT Id, start_date__c, end_date__c, number_of_days__c
                      FROM Account WHERE Name = 'TestAcct3'];

        acc.start_date__c = date.newInstance(2022, 2, 1);
        acc.Number_of_Days__c = 0;
        update acc;
        
        List<Id> ids = new List<Id>();
        Id myId = acc.Id;
        ids.add(myId);
        List<Date> endDates = PopulateAccountEndDate.addNumberOfDays(ids);        
        
        system.assertEquals('2/1/2022', endDates[0].format());
    }
    
    @istest 
    static void whenNumberofDaysIsNull(){
        
        Account acc = [SELECT Id, start_date__c, end_date__c, number_of_days__c
                      FROM Account WHERE Name = 'TestAcct4'];

        acc.start_date__c = date.newInstance(2022, 2, 1);
        acc.Number_of_Days__c = null;
        update acc;
        
        List<Id> ids = new List<Id>();
        Id myId = acc.Id;
        ids.add(myId);
        List<Date> endDates = PopulateAccountEndDate.addNumberOfDays(ids);        
        
        system.assertEquals('2/1/2022', endDates[0].format());
    }
    
    @istest 
    static void whenNumberofDaysIsThree(){
        
        Account acc = [SELECT Id, start_date__c, end_date__c, number_of_days__c
                      FROM Account WHERE Name = 'TestAcct5'];

        acc.start_date__c = date.newInstance(2022, 2, 1);
        acc.Number_of_Days__c = 3;
        update acc;
        
        List<Id> ids = new List<Id>();
        Id myId = acc.Id;
        ids.add(myId);
        List<Date> endDates = PopulateAccountEndDate.addNumberOfDays(ids);        
        
        system.assertEquals('2/3/2022', endDates[0].format());
    }
    
    @istest 
    static void whenNumberofDaysIsFive(){
        
        Account acc = [SELECT Id, start_date__c, end_date__c, number_of_days__c
                      FROM Account WHERE Name = 'TestAcct6'];

        acc.start_date__c = date.newInstance(2022, 2, 1);
        acc.Number_of_Days__c = 5;
        update acc;
        
        List<Id> ids = new List<Id>();
        Id myId = acc.Id;
        ids.add(myId);
        List<Date> endDates = PopulateAccountEndDate.addNumberOfDays(ids);        
        
        system.assertEquals('2/7/2022', endDates[0].format());
    }
  
}