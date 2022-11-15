import {LightningElement, track} from 'lwc';

import sendWeather from '@salesforce/apex/WeatherController.returnWeather';

import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class InputCity extends LightningElement {
    searchKey;
    @track weather;

    getCity () {
        sendWeather ({city: this.searchKey})
            .then(result=> {
                this.weather = result;
            })
            .catch(error =>
                this.dispatchEvent (
                    new ShowToastEvent ({
                        title: 'Error',
                        variant: 'error',
                        message: error.body.message + this.searchKey,
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