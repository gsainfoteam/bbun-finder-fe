import dayjs from "dayjs";

export interface UserInfo {
  uuid: string;
  name: string;
  email: string;
  createdAt: dayjs.Dayjs | string;
}
