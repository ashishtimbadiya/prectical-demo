import { Component, OnInit, ViewChild } from '@angular/core';
import { ApiServiceService } from '../service/api-service.service';
import { UserListModel, UserModel } from '../Modal/usermodel';
import { CommonService } from '../service/common-service.service';

@Component({
  selector: 'app-register-user-report',
  templateUrl: './register-user-report.component.html',
  styleUrls: ['./register-user-report.component.css']
})
export class RegisterUserReportComponent implements OnInit {
  @ViewChild('myModalClose') modalClose;
  constructor(private apiService: ApiServiceService, private sharedService: CommonService) { }
  userList: UserListModel[] = [];
  updateUser = new UserModel();
  deleteUserId: number;
  ngOnInit(): void {
    this.getUserReport();
  }
  getUserReport() {
    this.apiService.getUserReport().subscribe((data) => {
      if (data) {
        this.userList = data.List;
      }
    }, err => {
      console.log(err);
    });
  }
  deleteUser() {
    this.apiService.deleteUser(this.deleteUserId).subscribe((data) => {
      if (data.Status.code == 0) {
        this.sharedService.showToastr(0, data.Status.retrunMassage, true);
        this.getUserReport();
      } else {
        this.sharedService.showToastr(1, data.Status.retrunMassage, true);
      }
      this.modalClose.nativeElement.click();
    }, err => {

    });


  }
  editUser(item: UserModel) {
    this.updateUser = item;
  }
  userupdate(item: boolean) {
    if (item) {
      this.getUserReport();
    }
  }
}
