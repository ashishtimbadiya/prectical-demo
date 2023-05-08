import { HttpClient } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ApiServiceService {
  private apiUrl = '';
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) {
    console.log(baseUrl);
     this.apiUrl = baseUrl;
  }
  getState() {
    return this.http.get<any>(this.apiUrl + 'api/User/CommonData');
  }
  getUserReport() {
    return this.http.get<any>(this.apiUrl + 'api/User/UserReport');
  }
  registerUser(data) {
    return this.http.post<any>(this.apiUrl + 'api/User/UserRegister', data);
  }
  updateUser(data) {
    return this.http.post<any>(this.apiUrl + 'api/User/UpdateUser', data);
  }
  deleteUser(data) {
    return this.http.delete<any>(this.apiUrl + `api/User/DeleteUser?Id=${data}`);
  }
}
