import api from "./interceptor";
import LocalStorageKeys from "../types/localstorage";

interface ProfileData {
  department?: string;
  MBTI?: string;
  instaId?: string;
  description?: string;
}

const IDP_API_URL = import.meta.env.VITE_IDP_API_URL;

export const getUser = async () => {
  const token = localStorage.getItem(LocalStorageKeys.AccessToken);
  if (!token) {
    throw new Error("Missing access_token");
  }
  return api
    .get(`${IDP_API_URL}/oauth2/userinfo`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
    .then(({ data }) => data);
};

export const registerBbunUser = async () => {
  return api.post(`/user`, {}).then(({ data }) => data);
};

export const getBbunUser = async () => {
  return api.get(`/user`).then(({ data }) => data);
};

export const updateBbunUser = async (profileData: ProfileData) => {
  return api.patch(`/user`, profileData).then(({ data }) => data);
};

export const withdrawBbunUser = async () => {
  return api.delete(`/user`).then(({ data }) => data);
};
