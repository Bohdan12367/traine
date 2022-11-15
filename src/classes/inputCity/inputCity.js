import {LightningElement, track} from 'lwc';
<<<<<<< HEAD

import sendWeather from '@salesforce/apex/WeatherController.returnWeather';

=======

import sendWeather from '@salesforce/apex/WeatherController.handler';
>>>>>>> d547c3e7129e73798b704a49128089f329641984
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class InputCity extends LightningElement {
    searchKey;
    @track weather;

    getCity () {
        sendWeather ({city: this.searchKey})
<<<<<<< HEAD
            .then(result=> {
                this.weather = result;
=======
            .then(result=>{
                this.weather = result;
                this.imageURL = result.Image__c;
>>>>>>> d547c3e7129e73798b704a49128089f329641984
            })
            .catch(error =>
                this.dispatchEvent (
                    new ShowToastEvent ({
                        title: 'Error',
                        variant: 'error',
<<<<<<< HEAD
                        message: error.body.message + this.searchKey,
=======
                        message: 'Please enter valid city',
>>>>>>> d547c3e7129e73798b704a49128089f329641984
                    })
                ));
        this.weather = null;
    }

<<<<<<< HEAD

    get temp() {
        return Number(this.weather.Temperature__c).toFixed(2);
    }

=======
    get temp() {
        return Number(this.weather.Temperature__c).toFixed(2);
    }
>>>>>>> d547c3e7129e73798b704a49128089f329641984
    handleChange(event) {
        this.searchKey = event.target.value;
    }
}