public class PopulateAccountEndDate {
    
    @InvocableMethod(label='Add Number Of Days')
    public static List<Date> addNumberOfDays (List<Id> Ids){
        
        // Get the default business hours
        BusinessHours bh = [SELECT Id FROM BusinessHours WHERE Name = 'WeekDays'];
        List<Account> Accounts = [SELECT Id, start_date__c, number_of_days__c FROM Account 
                                  WHERE Id in :Ids];
        List<Date> endDates = new List<Date>();
        
        for (Account a: Accounts){
            Date startDate = a.start_date__c;
            Decimal value =  a.number_of_days__c == null ? 1.0 : a.number_of_days__c;
            Integer numberOfDays = Integer.valueOf(value);
            numberOfDays = numberOfDays == 0 ? 1 : numberOfDays;
            DateTime dT = BusinessHours.addGmt(bh.id, startDate, numberOfDays * 86400000);
        	Date endDate = Date.newInstance(dT.year(), dT.month(), dT.day());
            endDates.add(endDate);
        }    
        return endDates;
    }
}