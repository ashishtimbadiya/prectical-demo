namespace Megaminds_prectical.Model
{
    public static class Common
    {
        public static string ConnectionString = "";
    }
    public class AddUserModel
    {
        public string username { get; set; }
        public string email { get; set; }
        public string mobileNo { get; set; }
        public string address { get; set; }
        public int stateId { get; set; }
        public int? id { get; set; }
        public int cityId { get; set; }
    }

    public class StateModel
    {
        public int Id { get; set; }
        public string Statename { get; set; }
    }


    public class CityModel
    {
        public int Id { get; set; }
        public int StateId { get; set; }
        public string Cityname { get; set; }
    }

    public class UserListModel
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string MobileNo { get; set; }
        public string Address { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
        public string Cityname { get; set; }
        public string Statename { get; set; }
    }
    public class TranStatus
    {
        public int Code { get; set; } = 0;
        public string RetrunMassage { get; set; } = "";
    }
}
