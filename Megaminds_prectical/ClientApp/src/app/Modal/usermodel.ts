export class UserModel {
    username: string;
    email: string;
    mobileNo: string;
    address: string;
    cityId: number;
    stateId: number;
    id?: number;
}
export class StateListModel {
    id: number;
    statename: string;
}
export class CityListModel {
    id: number;
    stateId: number;
    cityname: string;
}

export class UserListModel {
    username: string;
    email: string;
    mobileNo: string;
    acityname: string;
    statename: string;
    cityId: number;
    stateId: number;
}