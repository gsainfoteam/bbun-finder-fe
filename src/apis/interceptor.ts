import LocalStorageKeys from "../types/localstorage";
import axios from "axios";

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
});

api.interceptors.request.use((config) => {
  const bbunToken = localStorage.getItem(LocalStorageKeys.BbunAccessToken);
  if (!bbunToken) return config;

  config.headers["Authorization"] = `Bearer ${bbunToken}`;
  return config;
});

export default api;
