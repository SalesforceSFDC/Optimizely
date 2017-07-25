global class UpdateRelatedAccounts {
  @future
  public static void someFutureMethod(List<Id> recordIds) {
    List<Account> accounts = [Select Id, Name from Account Where Id IN :recordIds];
    // process account records to do awesome stuff
  }
}

trigger UpdateAmount on Quote__c (after insert, after update) {

    List<Opportunity> parentObjList = new List<Opportunity>();
    List<Id> listIds = new List<Id>();
    List<Quote__c> newQuotes = new Quote[]{};

    for (Quote__c childObj : Trigger.new {
        listIds.add(childObj.Opportunity);
        newQuotes.put(childObj.Opportunity, Quote__c);
    }

   parentObjList = [SELECT id,Name FROM Opportunity WHERE ID IN :listIds];

   for (Opportunity opp : parentObjList){

       opp.Amount = newQuotes.get(opp.Id).Total_List_Price__c;

       update parentObjectList;
    }
}


public class SomeClass {
  public static void someMethod {
    Map<Id, Subscription__c> parentRecord = new Map<Id, Subscription__c>();
    List<Id> listIds = new List<Id>();

    for ({})

    parentRecord = new Map<Id, Subscription__c>([SELECT Id, Name FROM Subscription__c WHERE ID IN :listIds]);
  }

  update parentRecords.();
}
