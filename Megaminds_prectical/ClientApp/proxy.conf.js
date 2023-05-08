const { env } = require('process');

const target = env.ASPNETCORE_HTTPS_PORT ? `https://localhost:${env.ASPNETCORE_HTTPS_PORT}` :
  env.ASPNETCORE_URLS ? env.ASPNETCORE_URLS.split(';')[0] : 'http://localhost:17554';
debugger
const PROXY_CONFIG = [
  {
    context: [
      "/api/User/UserRegister",
      "/api/User/UpdateUser",
      "/api/User/DeleteUser",
      "/api/User/UserReport",
      "/api/User/CommonData",
   ],
    target: target,
    secure: false,
    headers: {
      Connection: 'Keep-Alive'
    }
  }
]

module.exports = PROXY_CONFIG;
