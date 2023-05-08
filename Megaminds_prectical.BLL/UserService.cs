using Megaminds_prectical.BLL.Interface;
using Megaminds_prectical.DAL;
using Megaminds_prectical.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Megaminds_prectical.BLL
{
    public class UserService : IUser
    {
        UserRepository userrepo = null;


        public Task<TranStatus> AddUser(AddUserModel addUser)
        {
            using (userrepo = new UserRepository())
            {
                return userrepo.AddUser(addUser);
            }
        }

        public Task<TranStatus> EditUser(AddUserModel addUser)
        {
            using (userrepo = new UserRepository())
            {
                return userrepo.EditUser(addUser);
            }
        }

        public Task<TranStatus> DeleteUser(int Id)
        {
            using (userrepo = new UserRepository())
            {
                return userrepo.DeleteUser(Id);
            }
        }

        public Task<List<UserListModel>> UserReport()
        {
            using (userrepo = new UserRepository())
            {
                return userrepo.UserReport();
            }
        }
        public Task<Tuple<List<StateModel>, List<CityModel>>> CommonData()
        {
            using (userrepo = new UserRepository())
            {
                return userrepo.CommonData();
            }
        }
    }
}
