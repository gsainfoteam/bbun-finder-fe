import api from "./interceptor";

export const getBbun = async () => {
    return api
        .get(`/bbun`)
        .then(({ data }) => data);
};