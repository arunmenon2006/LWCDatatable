public with sharing class DatatableCtrl {
    @AuraEnabled(cacheable=true)
    public static List<SObject> fetchRecords(String objectName, List<String> fields, Integer noOfRecords, String filterCriteria) {
        String query = 'SELECT ';
        Integer fieldPos = 0;
        for(String field : fields) {
            if(fieldPos < fields.size()) {
                query += field +',';
            } else {
                query += field;
            }            
        }
        query += ' FROM ' + objectName;
        if(String.isNotBlank(filterCriteria)) {
            query += 'WHERE ' + filterCriteria;
        }

        if(String.isNotBlank(noOfRecords)) {
            query += ' LIMIT ' + noOfRecords;
        }

        List<SObject> records = Database.query(query);
        return records;
    }
}
