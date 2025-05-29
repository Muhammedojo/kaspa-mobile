const liveMode = bool.fromEnvironment("mode", defaultValue: false);
const baseUrl = liveMode ? 
"https://kaspa.effing.cloud"  
 //"https://5fb2-154-113-120-30.ngrok-free.app" 
 : "https://kaspa.effing.cloud";
const baseApi = "$baseUrl/api/v1/";

const loginEndpoint = "auth/login";
const forgotPasswordEndpoint = "auth/password/forgot";
const resetPasswordEndpoint = "auth/password/change";
const usersListEndpoint = "users";
const createUserEndpoint = "users";
const farmersListEndpoint = "farmers";
const dashboardFarmerEndpoint = "dashboard/farmers";
const registerFarmerEndpoint = "farmers";
const cooperativeListEndpoint = "cooperatives";
const createCooperativeEndpoint = "cooperatives";
const updateCooperativesEndpoint = "cooperatives";
const cropListEndpoint = "crops";
const plotListEndpoint = "plots";
const farmVisitListEndpoint = "farm-visits";
const createFarmVisitEndpoint = "farm-visits";
const cropCalendarListEndpoint = "crop-calendar";
const incidentReportListEndpoint = "incident-reports";
const createIncidentReportEndpoint = "incident-reports";
const productListEndpoint = "products";
const weatherListEndpoint = "weather-data";
const lgaWeatherListEndpoint = "weather-data?lga=3";
const marketListEndpoint = "markets";
const createMarketEndpoint = "markets";
const logMarketPriceEndpoint = "market-data";
const marketPriceListEndpoint = "market-data";
const livestockListEndpoint = "livestocks";
const lgaListEndpoint = "locations/lgas";
const wardListEndpoint = "locations/wards";
const bankListEndpoint = "banks";
const dashboardEndpoint = "dashboard/home";
const userListEndpoint = "users";




