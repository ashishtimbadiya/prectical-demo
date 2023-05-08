using Megaminds_prectical.BLL.Interface;
using Megaminds_prectical.Model;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace Megaminds_prectical.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUser iUser;
        public UserController(IUser iUser)
        {
            this.iUser = iUser;
        }

        [HttpPost]
        [Route(nameof(UserRegister))]
        public async Task<IActionResult> UserRegister([FromBody] AddUserModel addUser)
        {
            HttpStatusCode statusCode = HttpStatusCode.OK;
            Dictionary<string, object> dctData = new Dictionary<string, object>();
            TranStatus tranStatus = new TranStatus();
            try
            {
                if (!string.IsNullOrWhiteSpace(addUser.username) && !string.IsNullOrWhiteSpace(addUser.mobileNo) && !string.IsNullOrWhiteSpace(addUser.email))
                {
                    tranStatus = await iUser.AddUser(addUser);
                }
                else
                {
                    tranStatus.Code = 1;
                    tranStatus.RetrunMassage = "all detail are mandetory";
                }
            }
            catch (Exception ex)
            {
                tranStatus.Code = 1;
                tranStatus.RetrunMassage = "somting went wronge";
                statusCode = HttpStatusCode.BadRequest;
            }
            dctData.Add("Status", tranStatus);

            return this.StatusCode(Convert.ToInt32(statusCode), dctData);

        }

        [HttpPost]
        [Route(nameof(UpdateUser))]
        public async Task<IActionResult> UpdateUser([FromBody] AddUserModel addUser)
        {
            HttpStatusCode statusCode = HttpStatusCode.OK;
            Dictionary<string, object> dctData = new Dictionary<string, object>();
            TranStatus tranStatus = new TranStatus();
            try
            {
                if (addUser != null && addUser.id > 0)
                {
                    tranStatus = await iUser.EditUser(addUser);
                }
                else
                {
                    tranStatus.Code = 1;
                    tranStatus.RetrunMassage = "User not valid";
                }
            }
            catch (Exception ex)
            {
                tranStatus.Code = 1;
                tranStatus.RetrunMassage = "somting went wronge";
                statusCode = HttpStatusCode.BadRequest;
            }
            dctData.Add("Status", tranStatus);

            return this.StatusCode(Convert.ToInt32(statusCode), dctData);

        }

        [HttpDelete]
        [Route(nameof(DeleteUser))]
        public async Task<IActionResult> DeleteUser([FromQuery] int Id)
        {
            HttpStatusCode statusCode = HttpStatusCode.OK;
            Dictionary<string, object> dctData = new Dictionary<string, object>();
            TranStatus tranStatus = new TranStatus();
            try
            {
                if (Id != null && Id > 0)
                {
                    tranStatus = await iUser.DeleteUser(Id);
                }
                else
                {
                    tranStatus.Code = 1;
                    tranStatus.RetrunMassage = "User not valid";
                }
            }
            catch (Exception ex)
            {
                tranStatus.Code = 1;
                tranStatus.RetrunMassage = "somting went wronge";
                statusCode = HttpStatusCode.BadRequest;
            }
            dctData.Add("Status", tranStatus);

            return this.StatusCode(Convert.ToInt32(statusCode), dctData);
        }


        [HttpGet]
        [Route(nameof(UserReport))]
        public async Task<IActionResult> UserReport()
        {
            HttpStatusCode statusCode = HttpStatusCode.OK;
            Dictionary<string, object> dctData = new Dictionary<string, object>();
            TranStatus tranStatus = new TranStatus();
            try
            {

                List<UserListModel> userLists = await iUser.UserReport();
                dctData.Add("List", userLists);
            }
            catch (Exception ex)
            {
                tranStatus.Code = 1;
                tranStatus.RetrunMassage = "somting went wronge";
                statusCode = HttpStatusCode.BadRequest;
            }
            dctData.Add("Status", tranStatus);

            return this.StatusCode(Convert.ToInt32(statusCode), dctData);

        }

        [HttpGet]
        [Route(nameof(CommonData))]
        public async Task<IActionResult> CommonData()
        {
            HttpStatusCode statusCode = HttpStatusCode.OK;
            Dictionary<string, object> dctData = new Dictionary<string, object>();
            TranStatus tranStatus = new TranStatus();
            try
            {

                (List<StateModel> state, List<CityModel> city) = await iUser.CommonData();
                dctData.Add("stateList", state);
                dctData.Add("cityList", city);
            }
            catch (Exception ex)
            {
                tranStatus.Code = 1;
                tranStatus.RetrunMassage = "somting went wronge";
                statusCode = HttpStatusCode.BadRequest;
            }
            dctData.Add("Status", tranStatus);

            return this.StatusCode(Convert.ToInt32(statusCode), dctData);

        }

    }
}