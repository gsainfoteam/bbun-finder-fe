import api from "./interceptor";
import axios from "axios";
import LocalStorageKeys from "../types/localstorage";

const IDP_API_URL = import.meta.env.VITE_IDP_API_URL;

export const getUser = async () => {
    return axios
        .get(`${IDP_API_URL}/oauth2/userinfo`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem(LocalStorageKeys.AccessToken)}`,
            },
        })
        .then(({ data }) => data);
};

export const registerBbunUser = async () => {
    return api
        .post(`/user`,{})
        .then(({ data }) => data);
};

export const getBbunUser = async () => {
    return api
        .get(`/user`)
        .then(({ data }) => data);
};

export const updateBbunUser = async (profileData: any) => {
    return api
        .patch(`/user`, profileData)
        .then(({ data }) => data);
};

export const withdrawBbunUser = async () => {
    return api
        .delete(`/user`)
        .then(({ data }) => data);
};

export const getBbun = async () => {
    return api
        .get(`/bbun`)
        .then(({ data }) => data);
};