using Dapper;
using Megaminds_prectical.Model;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Megaminds_prectical.DAL
{
    public class UserRepository : BaseRepository
    {

        public async Task<TranStatus> AddUser(AddUserModel addUser)
        {
            TranStatus tranStatus = new TranStatus();
            using (var conn = new SqlConnection(ConnectionString))
            {
                await conn.OpenAsync();
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Username", addUser.username);
                parameters.Add("@Email", addUser.email);
                parameters.Add("@Address", addUser.address);
                parameters.Add("@MobileNo", addUser.mobileNo);
                parameters.Add("@StateId", addUser.stateId);
                parameters.Add("@CityId", addUser.cityId);
                parameters.Add("@Code", dbType: DbType.Int32, direction: ParameterDirection.Output);
                parameters.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 500);
                await conn.QueryAsync("dbo.UserRegister", parameters, commandType: CommandType.StoredProcedure);
                tranStatus.Code = parameters.Get<int>("@Code");
                tranStatus.RetrunMassage = parameters.Get<string>("@Message");
            }
            return tranStatus;
        }


        public async Task<TranStatus> EditUser(AddUserModel addUser)
        {
            TranStatus tranStatus = new TranStatus();
            using (var conn = new SqlConnection(ConnectionString))
            {
                await conn.OpenAsync();
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Username", addUser.username);
                parameters.Add("@Email", addUser.email);
                parameters.Add("@UserId", addUser.id);
                parameters.Add("@Address", addUser.address);
                parameters.Add("@MobileNo", addUser.mobileNo);
                parameters.Add("@StateId", addUser.stateId);
                parameters.Add("@CityId", addUser.cityId);
                parameters.Add("@Code", dbType: DbType.Int32, direction: ParameterDirection.Output);
                parameters.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 500);
                await conn.QueryAsync("dbo.UpdateUser", parameters, commandType: CommandType.StoredProcedure);
                tranStatus.Code = parameters.Get<int>("@Code");
                tranStatus.RetrunMassage = parameters.Get<string>("@Message");
            }
            return tranStatus;
        }


        public async Task<TranStatus> DeleteUser(int Id)
        {
            TranStatus tranStatus = new TranStatus();
            using (var conn = new SqlConnection(ConnectionString))
            {
                await conn.OpenAsync();
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@UserId", Id);
                parameters.Add("@Code", dbType: DbType.Int32, direction: ParameterDirection.Output);
                parameters.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 500);
                await conn.QueryAsync("dbo.DeleteUser", parameters, commandType: CommandType.StoredProcedure);
                tranStatus.Code = parameters.Get<int>("@Code");
                tranStatus.RetrunMassage = parameters.Get<string>("@Message");
            }
            return tranStatus;
        }
        public async Task<List<UserListModel>> UserReport()
        {
            List<UserListModel> userLists = new List<UserListModel>();
            using (var conn = new SqlConnection(ConnectionString))
            {
                await conn.OpenAsync();
                userLists = (await conn.QueryAsync<UserListModel>("dbo.UserReport", commandType: CommandType.StoredProcedure))?.ToList();
            }
            return userLists;
        }
        public async Task<Tuple<List<StateModel>, List<CityModel>>> CommonData()
        {
            List<StateModel> stateList = new List<StateModel>();
            List<CityModel> cityList = new List<CityModel>();
            using (var conn = new SqlConnection(ConnectionString))
            {
                await conn.OpenAsync();
                var result = await conn.QueryMultipleAsync("dbo.CommonData", commandType: CommandType.StoredProcedure);
                if (!result.IsConsumed)
                {
                    stateList = (await result.ReadAsync<StateModel>())?.ToList() ?? new List<StateModel>();
                }
                if (!result.IsConsumed)
                {
                    cityList = (await result.ReadAsync<CityModel>())?.ToList() ?? new List<CityModel>();
                }
            }
            return new Tuple<List<StateModel>, List<CityModel>>(stateList, cityList);
        }
    }
}
