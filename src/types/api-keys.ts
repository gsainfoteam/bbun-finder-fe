const apiKeys = {
  auth: {
    login: "/user/login",
    info: "/user/idp",
  },
};

export const Methods = {
  Post: "post",
  Get: "get",
  Patch: "patch",
  Delete: "delete",
} as const;

export type Methods = (typeof Methods)[keyof typeof Methods];

export default apiKeys;
