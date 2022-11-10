import {LightningElement, track} from 'lwc';

import sendWeather from '@salesforce/apex/WeatherController.handler';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class InputCity extends LightningElement {
    searchKey;
    @track weather;
    @track imageURL;

    getCity () {
        sendWeather ({city: this.searchKey})
            .then(result=>{
                this.weather = result;
                this.imageURL = result.Image__c;
            })
            .catch(error =>
                this.dispatchEvent (
                    new ShowToastEvent ({
                        title: 'Error',
                        variant: 'error',
                        message: 'Please enter valid city',
                    })
                ));
        this.weather = null;
    }

    get temp() {
        return Number(this.weather.Temperature__c).toFixed(2);
    }
    handleChange(event) {
        this.searchKey = event.target.value;
    }
}