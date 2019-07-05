import { LightningElement, wire } from 'lwc';
import findRecords from '@salesforce/apex/DatatableCtrl.fetchRecords';

export default class Datatable extends LightningElement {
    @wire(findRecords, {objectName : 'Account', fields : ['Name','Phone', 'Type', 'Website'], noOfRecords : 100, filterCriteria : ''}) records;
}