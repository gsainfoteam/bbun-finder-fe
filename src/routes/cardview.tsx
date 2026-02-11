import { createFileRoute, useRouter } from '@tanstack/react-router'
import { useState, useEffect } from "react";
import Button from "../components/Button";
import { getBbunUser } from "../apis/user";
import { getBbun } from "../apis/bbun";
import button_left from "../assets/icons/button_left.svg";
import button_right from "../assets/icons/button_right.svg";
import snowflake_1 from "../assets/icons/snowflake_1.svg";
import snowflake_4 from "../assets/icons/snowflake_4.svg";
import snowflake_5 from "../assets/icons/snowflake_5.svg";
import onboarding_page_deco from "../assets/icons/onboarding_page_deco.svg";
import skating_icon_Default from "../assets/icons/skating_icon_Default.svg";
import default_profile_1 from "../assets/icons/default_profile_1.png";
import default_profile_2 from "../assets/icons/default_profile_2.png";
import default_profile_3 from "../assets/icons/default_profile_3.png";
import default_profile_4 from "../assets/icons/default_profile_4.png";
import default_profile_5 from "../assets/icons/default_profile_5.png";

type CardViewSearch = {
  name: string;
  studentId: string;
  major: string;
  email: string;
  mbti: string;
  instagramId: string;
  centerColor: string;
};

interface BbunCardData {
  uuid: string;
  name: string;
  studentNumber: string;
  email: string;
  profileImageUrl: string | null;
  createdAt: string;
  updatedAt: string;
  deletedAt: string | null;
  consent: boolean;
  department: string | null;
  MBTI: string | null;
  instaId: string | null;
  description: string | null;
}

const departmentMap: Record<string, string> = {
  "전기전자컴퓨터공학과": "EC",
  "AI융합학과": "AI",
  "반도체공학과": "SE",
  "물리광과학과": "PS",
  "화학과": "CH",
  "수리과학과": "MM",
  "신소재공학과": "MA",
  "기계로봇공학과": "MC",
  "환경에너지공학과": "EV",
  "생명과학과": "BS",
  "도전탐색과정": "GS",
};

const reverseDepartmentMap: Record<string, string> = Object.fromEntries(
  Object.entries(departmentMap).map(([name, code]) => [code, name])
);

export const Route = createFileRoute('/cardview')({
  validateSearch: (search: Record<string, unknown>): CardViewSearch => {
    return {
      name: (search.name as string) || "홍길동",
      studentId: (search.studentId as string) || "20250000",
      major: (search.major as string) || "도전탐색과정",
      email: (search.email as string) || "example@gm.gist.ac.kr",
      mbti: (search.mbti as string) || "INTJ",
      instagramId: (search.instagramId as string) || "@aaa",
      centerColor: (search.centerColor as string) || "blue",
    };
  },
  component: RouteComponent,
})

function RouteComponent() {
  const router = useRouter();
  const { name, studentId, major, email, mbti, instagramId, centerColor } = Route.useSearch();
  const [currentUserStudentId, setCurrentUserStudentId] = useState<string | null>(null);
  const [bbunList, setBbunList] = useState<BbunCardData[]>([]);

  useEffect(() => {
    getBbunUser()
      .then((data) => {
        setCurrentUserStudentId(data.studentNumber);
      })
      .catch((error) => {
        console.error("Failed to fetch current user profile:", error);
      });

    getBbun()
      .then((data) => {
        setBbunList(data.list || []);
      })
      .catch((error) => {
        console.error("Failed to fetch Bbun-line list:", error);
      });
  }, []);

  const currentIndex = bbunList.findIndex(card => card.studentNumber === studentId);
  const hasPrev = currentIndex > 0;
  const hasNext = currentIndex !== -1 && currentIndex < bbunList.length - 1;

  const navigateToCard = (card: BbunCardData, index: number) => {
    router.navigate({
      to: "/cardview",
      search: {
        name: card.name,
        studentId: card.studentNumber,
        major: reverseDepartmentMap[card.department || ""] || card.department || "",
        email: card.email,
        mbti: card.MBTI || "",
        instagramId: card.instaId || "",
        centerColor: ["blue", "purple", "pink", "yellow", "green"][index % 5],
      },
    });
  };

  const isMine = currentUserStudentId === studentId;

  const imageSrcs: Record<string, string> = {
    blue: default_profile_1,
    purple: default_profile_2,
    green: default_profile_3,
    yellow: default_profile_4,
    pink: default_profile_5,
  };

  const imageSrc = imageSrcs[centerColor] || default_profile_1;

  return (
    <div className='w-full h-[100dvh] overflow-y-auto scrollbar-hide overflow-x-hidden'>
      <div className='relative min-h-[100dvh] w-full bg-blue-200 bg-[linear-gradient(162deg,#D2E4FF,#E9E0FF)] flex flex-col justify-start items-center bg-fixed'>
        {/* 배경 장식*/}
        <div>
          <img
            className="absolute left-1/2 -translate-x-1/2 ml-[95px] top-[29px] w-[35px] h-[35px]"
            src={snowflake_1}
          />
          <img
            className="absolute left-1/2 -translate-x-1/2 ml-[134px] top-[159px] w-[65px] h-[65px]"
            src={snowflake_4}
          />
          <img
            className="absolute left-1/2 -translate-x-1/2 top-[277px] w-full"
            src={onboarding_page_deco}
          />
        </div>
        {/* 콘텐츠 */}
        <div className="z-10 relative flex flex-col justify-start items-start gap-[18px] w-[315px] ml-[-5px] mt-[76px] mb-[13px]">
          <div className="flex flex-row items-center gap-[14px]">
            <img className="w-[34px] h-[30px]" src={skating_icon_Default} />
            <p className="leading-[36px] text-[25px] text-[#414177] font-bold font-ria">
              뻔라인스케이팅
            </p>
          </div>
        </div>
        <div className="flex flex-row justify-between items-center w-[326px] mt-[34px] gap-[20px]">
          <button 
            onClick={() => hasPrev && navigateToCard(bbunList[currentIndex - 1], currentIndex - 1)}
            className={`transition-opacity ${!hasPrev ? "opacity-0 cursor-default" : "cursor-pointer active:scale-95"}`}
            disabled={!hasPrev}
          >
            <img src={button_left} alt="previous" className="w-[30px] h-[30px]"/>
          </button>
          
          <div className="flex flex-col items-center">
            <img src={imageSrc} alt="profile" className="w-[78px] h-[78px]"/>
            <div className="text-[25px] text-[#414177] mt-[12px] font-extrabold">{name}</div>
            <div className="text-[14px] font-extrabold mt-[14px]">{studentId} • {major}</div>
          </div>

          <button 
            onClick={() => hasNext && navigateToCard(bbunList[currentIndex + 1], currentIndex + 1)}
            className={`transition-opacity ${!hasNext ? "opacity-0 cursor-default" : "cursor-pointer active:scale-95"}`}
            disabled={!hasNext}
          >
            <img src={button_right} alt="next" className="w-[30px] h-[30px]"/>
          </button>
        </div>
        <div className="z-10 bg-[#FFFFFF]/50 w-[326px] rounded-[8px] flex flex-col px-[24px] py-[30px] mt-[54px] gap-[20px]">
          <div className="flex flex-row items-center gap-[14px] ">
            <img src={snowflake_5} alt="snowflake" className="w-[23px] h-[23px]" />
            <div className="text-[14px] font-bold">
              이메일: {email}
            </div>
          </div>
          <div className="flex flex-row items-center gap-[14px]">
            <img src={snowflake_5} alt="snowflake" className="w-[23px] h-[23px]" />
            <div className="text-[14px] font-bold">
              MBTI: {mbti}
            </div>
          </div>
          <div className="flex flex-row items-center gap-[14px]">
            <img src={snowflake_5} alt="snowflake" className="w-[23px] h-[23px]" />
            <div className="text-[14px] font-bold">
              instagram ID: {instagramId}
            </div>
          </div>
        </div>
        <div className="mt-auto pb-[calc(56px+env(safe-area-inset-bottom))] z-10">
          <Button
            label={isMine ? "수정하기" : "뒤로가기"}
            onClick={() => {
              if (isMine) {
                router.navigate({ to: "/profile" });
              } else {
                router.navigate({ to: "/" });
              }
            }}
          />
        </div>
      </div>
    </div>
  )
}
