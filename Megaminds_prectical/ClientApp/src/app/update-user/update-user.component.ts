import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges, ViewChild } from '@angular/core';
import { CityListModel, StateListModel, UserModel } from '../Modal/usermodel';
import { ApiServiceService } from '../service/api-service.service';
import { CommonService } from '../service/common-service.service';

@Component({
  selector: 'app-update-user',
  templateUrl: './update-user.component.html',
  styleUrls: ['./update-user.component.css']
})
export class UpdateUserComponent implements OnInit, OnChanges {

  constructor(private apiService: ApiServiceService, private sharedService: CommonService) { }
  @Input() updateUser;
  @ViewChild('myModalClose') modalClose;
  @Output() isSuccess: EventEmitter<any> = new EventEmitter<any>();
  cityList: CityListModel[] = [];
  tempCityList: CityListModel[] = [];
  stateList: StateListModel[] = [];
  editUserReq = new UserModel();
  ngOnInit(): void {

    this.getState();
  }
  ngOnChanges(): void {
    this.updateUser = JSON.parse(JSON.stringify(this.updateUser));
    this.tempCityList = this.cityList.filter(x => x.stateId == this.updateUser.stateId)
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
  update() {

    let strWarning = '';
    const namepattern = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{0,29}$/igm;
    if (!this.updateUser.username) {
      strWarning += '- Please enter UserName <br/>';
    }
    if (this.updateUser.username && !namepattern.test(this.updateUser.username)) {
      strWarning += `<dl>
                        <dt> - Invalid username <dt/>
                        <dd> - The username should not blank and it does not accept special characters </dd>
                      </dl>`;
    }

    if (!this.updateUser.email) {
      strWarning += '- Please enter Email Address <br/>';
    }
    if (!this.updateUser.mobileNo || this.updateUser.mobileNo.length != 10) {
      strWarning += '- Please enter valid Mobile number <br/>';
    }
    if (!this.updateUser.email && this.updateUser.email != '' && !this.sharedService.checkEmail(this.updateUser.email)) {
      strWarning += '- Please enter valid email <br/>';;
    }

    if (strWarning !== '') {
      this.sharedService.showToastr(1, strWarning, true);
      return;
    } else {
      this.apiService.updateUser(this.updateUser).subscribe((data) => {
        if (data.Status.code == 0) {
          this.sharedService.showToastr(0, data.Status.retrunMassage, true);
          this.isSuccess.emit(true);
        } else {
          this.sharedService.showToastr(1, data.Status.retrunMassage, true);
          this.isSuccess.emit(false);
        }
        this.modalClose.nativeElement.click();
      }, err => {
        console.log(err);
        this.modalClose.nativeElement.click();
      })
    }
  }
  FilterData() {
    this.tempCityList = this.cityList.filter(x => x.stateId == this.updateUser.stateId);
  }
}
