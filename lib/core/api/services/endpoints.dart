const liveMode = bool.fromEnvironment("mode", defaultValue: false);
const baseUrl = liveMode ? "https://kaspa.effing.cloud" : "https://kaspa.effing.cloud";
const baseApi = "$baseUrl/api/v1/";

const loginEndpoint = "auth/login";
const forgotPasswordEndpoint = "auth/password/forgot";
const resetPasswordEndpoint = "auth/password/change";
const usersListEndpoint = "users";
const createUserEndpoint = "users";
const farmersListEndpoint = "farmers";
const registerFarmerEndpoint = "farmers";
const cooperativeListEndpoint = "cooperatives";
const createCooperativeEndpoint = "cooperatives";
const updateCooperativesEndpoint = "cooperatives/";
const cropListEndpoint = "crops";
const livestockListEndpoint = "livestocks";
const lgaListEndpoint = "locations/lgas";
const wardListEndpoint = "locations/wards";
const bankListEndpoint = "banks";
const userListEndpoint = "users";




