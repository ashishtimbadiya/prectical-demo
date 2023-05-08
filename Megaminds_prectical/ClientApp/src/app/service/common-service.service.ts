import { HttpClient } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { IndividualConfig, ToastrService } from 'ngx-toastr';
export enum APIStautusCode { Success = 0, Warning = 1, Error = 2, Info = 3 }
@Injectable({
  providedIn: 'root'
})
export class CommonService {
  constructor(private toastr: ToastrService,) {


  }
  checkEmail(email: string) {
    if (!email || email === '') {
      //  this.showToastr(1, 'Please enter email');
      return false;
    }
    // const EmailReg = /^([a-zA-Z0-9_\-\.]+)@[a-zA-Z0-9][a-zA-Z0-9_\-]+\.([a-zA-Z]{2,5})$/g;
    // tslint:disable-next-line: max-line-length
    const EmailReg = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/g;
    if (!EmailReg.test(email)) {
      //  this.showToastr(1, 'Please enter valid email');
      return false;
    } else {
      return true;
    }
  }
  
  showToastr(responseCode: APIStautusCode, message: string, enableHtml: boolean = false, timeOut: number = 5000) {
    const toastSetting: Partial<IndividualConfig> = {
      progressBar: true,
      closeButton: true,
      enableHtml,
      timeOut
    };
    if (responseCode === 0) {
      this.toastr.success(message, 'Success', toastSetting);
    } else if (responseCode === 1) {
      this.toastr.warning(message, 'Warning', toastSetting);
    } else if (responseCode === 2) {
      this.toastr.error(message, 'Error', toastSetting);
    } else if (responseCode === 3) {
      this.toastr.info(message, 'Info', toastSetting);
    } else {
      this.toastr.error(message, 'Error', toastSetting);
    }
  }
}
