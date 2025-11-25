import clsx from "clsx";
import default_profile_1 from "../assets/icons/default_profile_1.svg";
import default_profile_2 from "../assets/icons/default_profile_2.svg";
import default_profile_3 from "../assets/icons/default_profile_3.svg";
import default_profile_4 from "../assets/icons/default_profile_4.svg";

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
  };
  const textColors: Record<string, string> = {
    purple: "text-[#886CD6]",
    orange: "text-[#FF682C]",
    green: "text-[#54C711]",
    pink: "text-[#FC639B]",
    blue: "text-[#2681D7]",
    yellow: "text-[#EBB608]",
  };

  const imageSrcs: Record<string, string> = {
    purple: default_profile_1,
    orange: default_profile_4,
    green: default_profile_1,
    pink: default_profile_3,
    blue: default_profile_4,
    yellow: default_profile_2,
  };

  const [gradientLight, gradientDark] =
    gradients[centerColor] || gradients["purple"];
  const textColor = textColors[centerColor] || textColors["purple"];
  const imageSrc = imageSrcs[centerColor] || imageSrcs["purple"];

  return (
    <div className="w-[321px] rounded-[15px] border-2 border-b-black overflow-hidden">
      {/* Top Bar */}
      <div className="h-[21px] bg-white relative">
        <p
          className={clsx(
            "text-[10px] absolute top-[7px] left-[10px]",
            textColor
          )}
        >
          funline sk8ter ID Card
        </p>

        <p
          className={clsx(
            "text-[10px] absolute top-[7px] right-[10px]",
            textColor
          )}
        >
          &gt;&gt;&gt;
        </p>
      </div>

      {/* Gradient Area */}
      <div
        className="h-[137px] flex justify-center items-center"
        style={{
          background: `radial-gradient(${gradientLight}, ${gradientDark})`,
        }}
      >
        <div className="w-[290px] h-[120px] flex items-start gap-[10px]">
          {/* Profile Image */}
          <div className="relative w-[90px] h-[113px] rounded-[5px] overflow-hidden">
            <img
              src={imageSrc}
              alt="profile"
              className="w-full h-full object-cover"
            />
            <div className="absolute inset-0 border-2 border-black rounded-[5px] pointer-events-none" />
          </div>

          {/* Text Content (Modified) */}
          <div className="flex flex-col h-[120px] justify-between">
            <div>
              <p
                className={clsx(
                  "text-[12px] leading-[15px] mb-[3px]",
                  textColor
                )}
              >
                NAME
              </p>
              <p className="text-[18px] leading-[22px] text-black font-semibold">
                {name}
              </p>
            </div>

            <div>
              <p
                className={clsx(
                  "text-[12px] leading-[15px] mb-[3px]",
                  textColor
                )}
              >
                STUDENT ID
              </p>
              <p className="text-[18px] leading-[22px] text-black font-semibold">
                {studentId}
              </p>
            </div>

            <div>
              <p
                className={clsx(
                  "text-[12px] leading-[15px] mb-[3px]",
                  textColor
                )}
              >
                E-MAIL
              </p>
              <p className="text-[14px] leading-[17px] text-black font-semibold">
                {email}
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Bottom Bar */}
      <div className="relative h-[13px] bg-white">
        <p className={clsx("text-[9px] absolute right-[10px]", textColor)}>
          issue date {issueDate}
        </p>
      </div>
    </div>
  );
}
