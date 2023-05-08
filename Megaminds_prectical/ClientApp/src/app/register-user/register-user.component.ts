import { Component, OnInit } from '@angular/core';
import { CityListModel, StateListModel, UserModel } from '../Modal/usermodel';
import { ApiServiceService } from '../service/api-service.service';
import { CommonService } from '../service/common-service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register-user',
  templateUrl: './register-user.component.html',
  styleUrls: ['./register-user.component.css']
})
export class RegisterUserComponent implements OnInit {

  constructor(private apiService: ApiServiceService, private sharedService: CommonService, private router: Router) { }
  regiterUser = new UserModel();
  cityList: CityListModel[] = [];
  tempCityList: CityListModel[] = [];
  stateList: StateListModel[] = [];
  isCheck: false;
  ngOnInit(): void {
    this.getState();
  }
  getState() {
    this.apiService.getState().subscribe((data) => {
      if (data) {
        this.cityList = data.cityList;
        this.stateList = data.stateList;
      }
    }, err => {
      console.log(err);
    });
  }
  registerUser() {
    let strWarning = '';
    const namepattern = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{0,29}$/igm;
    if (!this.regiterUser.username) {
      strWarning += '- Please enter UserName <br/>';
    }
    if (this.regiterUser.username && !namepattern.test(this.regiterUser.username)) {
      strWarning += `<dl>
                        <dt> - Invalid username <dt/>
                        <dd> - The username should not blank and it does not accept special characters </dd>
                      </dl>`;
    }

    if (!this.regiterUser.email) {
      strWarning += '- Please enter Email Address <br/>';
    }
    if (!this.regiterUser.mobileNo || this.regiterUser.mobileNo.length != 10) {
      strWarning += '- Please enter valid Mobile number <br/>';
    }
    if ((!this.regiterUser.email || this.regiterUser.email != '') && !this.sharedService.checkEmail(this.regiterUser.email)) {
      strWarning += '- Please enter valid email <br/>';;
    }
    if (!this.regiterUser.stateId) {
      strWarning += '- Please select state <br/>';;
    }
    if (!this.regiterUser.cityId) {
      strWarning += '- Please select city. <br/>';;
    }

    if (strWarning !== '') {
      this.sharedService.showToastr(1, strWarning, true);
      return;
    } else {
      if (this.isCheck) {

        this.apiService.registerUser(this.regiterUser).subscribe((data) => {
          if (data.Status.code == 0) {
            this.sharedService.showToastr(0, data.Status.retrunMassage, true);
            this.router.navigate(['/user-report']);
          } else {
            this.sharedService.showToastr(1, data.Status.retrunMassage, true);
          }
        }, err => {
          console.log(err);
        });
      } else {
        this.sharedService.showToastr(1, 'please accept Terms & Privacy..', true);
      }
    }
  }
  FilterData() {
    this.tempCityList = this.cityList.filter(x => x.stateId == this.regiterUser.stateId);
  }
}
