import { LightningElement, wire, track } from 'lwc';
import findRecords from '@salesforce/apex/DatatableCtrl.fetchRecords';

const columns = [
    {label: 'Account Name', fieldName: 'name', type: 'text'},
    {label: 'Phone', fieldName: 'phone', type: 'text'},
    {label: 'Type', fieldName: 'type', type: 'text'},
    {label: 'website', fieldName: 'website', type: 'text'},
    {label: 'Contact Phone', fieldName: 'phone', type: 'phone'},
];

export default class Datatable extends LightningElement {
    @track columns = columns;
    @wire(findRecords, {objectName : 'Account', fields : ['Name','Phone', 'Type', 'Website'], noOfRecords : 100, filterCriteria : ''}) records;    
    
}