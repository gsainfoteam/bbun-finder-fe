import default_profile_1 from "../assets/icons/default_profile_1.png";
import default_profile_2 from "../assets/icons/default_profile_2.png";
import default_profile_3 from "../assets/icons/default_profile_3.png";
import default_profile_4 from "../assets/icons/default_profile_4.png";
import default_profile_5 from "../assets/icons/default_profile_5.png";

interface MessageBubbleProps {
  name: string;
  studentId: string;
  messageSendTime: string;
  message: string;
  isMe: boolean;
  showProfile: boolean;
  showTime: boolean;
}

export default function MessageBubble({
  name,
  studentId,
  messageSendTime,
  message,
  isMe,
  showProfile,
  showTime,
}: MessageBubbleProps) {
  const parsedYear = Number.parseInt(studentId.slice(0, 4), 10);
  const profileIndex = Number.isFinite(parsedYear) ? parsedYear % 5 : 0;
  const profileSrcs: Record<number, string> = {
    0: default_profile_1,
    1: default_profile_2,
    2: default_profile_3,
    3: default_profile_4,
    4: default_profile_5,
  };

  return (
    <div
      className={`flex w-full ${isMe ? "justify-end" : ""} ${!showProfile ? "-mt-[12px]" : ""}`}
    >
      {isMe ? (
        /* 내가 보낸 메시지 */
        <div className="flex flex-row items-end gap-[4px] justify-end w-full">
          <div className="flex-none">
            {showTime && (
              <p className="text-[#989898] text-[10px] whitespace-nowrap mb-[2px]">
                {messageSendTime}
              </p>
            )}
          </div>
          <div className="max-w-[60%] bg-[#414177] rounded-tl-[20px] rounded-tr-[3px] rounded-bl-[20px] rounded-br-[20px] pl-[15px] pr-[18px] py-[10px]">
            <p className="text-[14px] text-[#FFFFFF] break-all leading-relaxed whitespace-pre-line">
              {message}
            </p>
          </div>
        </div>
      ) : (
        /* 상대방이 보낸 메시지 */
        <div className="flex flex-row items-end w-full">
          <div className="flex-shrink-0 w-[40px] self-start">
            {showProfile && (
              <img
                className="w-[40px] h-[40px] object-cover flex-shrink-0"
                src={profileSrcs[profileIndex % 5]}
                alt={`${name || "사용자"} 프로필 이미지`}
              />
            )}
          </div>

          <div className="ml-[10px] mr-[4px] max-w-[60%] flex flex-col">
            {showProfile && (
              <p className="mb-[6px] text-[#282828] font-bold text-[14px]">
                {name}
              </p>
            )}
            <div className="bg-[#EFEFEF] rounded-tl-[3px] rounded-tr-[20px] rounded-bl-[20px] rounded-br-[20px] pl-[15px] pr-[18px] py-[10px]">
              <p className="text-[14px] text-[#282828] break-all leading-relaxed whitespace-pre-line">
                {message}
              </p>
            </div>
          </div>

          <div className="flex-none">
            {showTime && (
              <p className="text-[#989898] text-[10px] whitespace-nowrap mb-[2px]">
                {messageSendTime}
              </p>
            )}
          </div>
        </div>
      )}
    </div>
  );
}
