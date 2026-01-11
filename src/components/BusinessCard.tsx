import clsx from "clsx";
import default_profile_1 from "../assets/icons/default_profile_1.svg";
import default_profile_2 from "../assets/icons/default_profile_2.svg";
import default_profile_3 from "../assets/icons/default_profile_3.svg";
import default_profile_4 from "../assets/icons/default_profile_4.svg";
import default_profile_5 from "../assets/icons/default_profile_5.svg";

interface BusinessCardProps {
  name: string;
  studentId: string;
  email: string;
  centerColor: string;
  issueDate: string;
}

export default function BusinessCard({
  name,
  studentId,
  email,
  centerColor,
  issueDate,
}: BusinessCardProps) {
  const gradients: Record<string, [string, string]> = {
    purple: ["#DDD1FF", "#A48EE4"],
    orange: ["#FFC591", "#FF9F51"],
    green: ["#D3EBC5", "#AFF486"],
    pink: ["#FFD6E5", "#FF9BBF"],
    blue: ["#C5E3FF", "#70B6F7"],
    yellow: ["#FDFD96", "#F1DA66"],
    newBlue: ["#D6E0FF", "#D6E0FF"],
  };
  const textColors: Record<string, string> = {
    purple: "text-[#886CD6]",
    orange: "text-[#FF682C]",
    green: "text-[#54C711]",
    pink: "text-[#FC639B]",
    blue: "text-[#2681D7]",
    yellow: "text-[#EBB608]",
    newBlue: "text-[#414177]",
  };

  const imageSrcs: Record<string, string> = {
    purple: default_profile_1,
    orange: default_profile_4,
    green: default_profile_1,
    pink: default_profile_3,
    blue: default_profile_4,
    yellow: default_profile_2,
    newBlue: default_profile_5,
  };

  const [gradientLight, gradientDark] =
    gradients[centerColor] || gradients["purple"];
  const textColor = textColors[centerColor] || textColors["purple"];
  const imageSrc = imageSrcs[centerColor] || imageSrcs["purple"];

  return (
    <div
      style={{
        background: `radial-gradient(${gradientLight}, ${gradientDark})`,
      }}
      className="flex flex-col justify-between w-fit h-fit rounded-[8px]"
    >
      <div className="h-[22px] bg-white relative">
        <p
          className={clsx(
            "text-[10px] leading-[12px] absolute top-[7px] left-[10px]",
            textColor
          )}
        >
          Funline skater ID Card
        </p>

        <p
          className={clsx(
            "text-[10px] leading-[11px] absolute top-[9px] right-[12px]",
            textColor
          )}
        >
          &gt;&gt;&gt;
        </p>
      </div>

      <div className="flex justify-center items-center">
        <div className="w-fit h-fit pt-[14px] pb-[14px] pl-[16px] pr-[36px] flex items-center gap-[14px]">
          <div className="relative w-[78px] h-[99px] rounded-[8px] overflow-hidden">
            <img
              src={imageSrc}
              alt="profile"
              className="w-full h-full object-cover"
            />
          </div>

          <div className="flex flex-col w-[183px] h-[118px] justify-between">
            <div>
              <p
                className={clsx(
                  "text-[12px] leading-[13px] mb-[4px] font-bold",
                  textColor
                )}
              >
                NAME
              </p>
              <p className="text-[15px] leading-[17px] text-black font-bold">
                {name}
              </p>
            </div>

            <div>
              <p
                className={clsx(
                  "text-[12px] leading-[13px] mb-[4px] font-bold",
                  textColor
                )}
              >
                STUDENT ID
              </p>
              <p className="text-[15px] leading-[17px] text-black font-bold">
                {studentId}
              </p>
            </div>

            <div>
              <p
                className={clsx(
                  "text-[12px] leading-[15px] mb-[4px] font-bold",
                  textColor
                )}
              >
                E-MAIL
              </p>
              <p className="text-[15px] leading-[17px] text-black font-bold">
                {email}
              </p>
            </div>
          </div>
        </div>
      </div>

      <div className="relative h-[22px] bg-white">
        <p
          className={clsx(
            "text-[10px] leading-[11px] absolute top-[2px] right-[12px]",
            textColor
          )}
        >
          issue date {issueDate}
        </p>
      </div>
    </div>
  );
}
