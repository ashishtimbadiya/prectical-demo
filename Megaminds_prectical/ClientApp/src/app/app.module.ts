import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { RegisterUserComponent } from './register-user/register-user.component';
import { RegisterUserReportComponent } from './register-user-report/register-user-report.component';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { UpdateUserComponent } from './update-user/update-user.component';
@NgModule({
  declarations: [
    AppComponent,
    RegisterUserComponent,
    RegisterUserReportComponent,
    UpdateUserComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    ToastrModule.forRoot(),
    RouterModule.forRoot([
      { path: '', component: RegisterUserComponent, pathMatch: 'full' },
      { path: 'registration', component: RegisterUserComponent, pathMatch: 'full' },
      { path: 'user-report', component: RegisterUserReportComponent },
    ])
  ],
  providers: [],
  entryComponents:[UpdateUserComponent],
  bootstrap: [AppComponent]
})
export class AppModule { }
