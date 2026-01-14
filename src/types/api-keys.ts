const apiKeys = {
  auth: {
    login: "/auth/login",
    info: "/auth/info",
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
