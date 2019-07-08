public with sharing class DatatableCtrl {
    @AuraEnabled(cacheable=true)
    public static List<SObject> fetchRecords(String objectName, List<String> fields, String noOfRecords, String filterCriteria) {
        String query = 'SELECT ';
        Integer fieldPos = 0;
        for(String field : fields) {
            if(fieldPos < fields.size() - 1) {
                query += field + ',';
            } else {
                query += field;
            }   
            fieldPos++;         
        }
        query += ' FROM ' + objectName;
        if(String.isNotBlank(filterCriteria)) {
            query += 'WHERE ' + filterCriteria;
        }

        if(String.isNotBlank(noOfRecords)) {
            query += ' LIMIT ' + noOfRecords;
        }

        system.debug(query);
        List<SObject> records = Database.query(query);        
        String listType = 'List<' + objectName + '>';
        List<SObject> castRecords = (List<SObject>)Type.forName(listType).newInstance();
        castRecords.addAll(records);
        System.debug(castRecords);
        return castRecords;
    }
}
