using Megaminds_prectical.Model;

namespace Megaminds_prectical.BLL.Interface
{
    public interface IUser
    {
        Task<TranStatus> AddUser(AddUserModel addUser);
        Task<TranStatus> EditUser(AddUserModel addUser);
        Task<TranStatus> DeleteUser(int Id);
        Task<List<UserListModel>> UserReport();
        Task<Tuple<List<StateModel>, List<CityModel>>> CommonData();
    }
}
