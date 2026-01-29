import {
  createFileRoute,
  Link,
  redirect,
  useRouter,
} from "@tanstack/react-router";
import { useState, useEffect } from "react";
import BusinessCard from "../components/BusinessCard";
import skating_icon_Default from "../assets/icons/skating_icon_Default.svg";
import snowflake_1 from "../assets/icons/snowflake_1.svg";
import snowflake_2 from "../assets/icons/snowflake_2.svg";
import snowflake_4 from "../assets/icons/snowflake_4.svg";

export const Route = createFileRoute("/")({
  /* 로그인 확인(임시) */
  beforeLoad: () => {
    const isAuthenticated = localStorage.getItem("accessToken");
    if (!isAuthenticated) {
      throw redirect({
        to: "/onboarding",
      });
    }
  },
  component: MainPage,
});

function MainPage() {
  const router = useRouter();
  const [isProfileRegistered, setIsProfileRegistered] = useState(false);

  useEffect(() => {
    const hasProfile = localStorage.getItem("hasProfile");
    if (hasProfile === "true") {
      setIsProfileRegistered(true);
    }
  }, []);

  const handleLogoutClick = () => {
    localStorage.removeItem("accessToken");
    localStorage.removeItem("hasProfile");

    router.navigate({ to: "/onboarding" });
  };

  const dummyCards = [1, 2, 3];

  const realCards = [
    {
      name: "지니",
      studentId: "20230001",
      email: "example@gist.ac.kr",
      centerColor: "blue",
      instagramId: "@aaa",
      department: "전기전자컴퓨터공학과",
    },
    {
      name: "어스",
      studentId: "20240001",
      email: "example@gist.ac.kr",
      centerColor: "purple",
      instagramId: "@bbb",
      department: "전기전자컴퓨터공학과",
    },
    {
      name: "예시",
      studentId: "20250001",
      email: "example@gist.ac.kr",
      centerColor: "pink",
      instagramId: "@ccc",
      department: "도전탐색과정",
    },
  ];

  return (
    <div className="w-full h-[100dvh] overflow-y-auto scrollbar-hide overflow-x-hidden">
      <div className="relative min-h-[100dvh] w-full bg-blue-200 bg-[linear-gradient(162deg,#D2E4FF,#E9E0FF)] flex flex-col justify-start items-center bg-fixed">
        {/* 배경 장식*/}
        <div>
          <img
            className="absolute left-1/2 -translate-x-1/2 ml-[95px] top-[29px] w-[35px] h-[35px]"
            src={snowflake_1}
          />
          <img
            className="absolute left-1/2 -translate-x-1/2 ml-[-139px] bottom-[88px] w-[57px] h-[57px]"
            src={snowflake_2}
          />
          <img
            className="absolute left-1/2 -translate-x-1/2 ml-[134px] top-[159px] w-[65px] h-[65px]"
            src={snowflake_4}
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

          {!isProfileRegistered ? (
            <p className="h-[87px] text-[15px] text-[#5E5E88] font-bold">
              뻔카드 확인을 위해서 최초 프로필 등록이 필요합니다. 프로필 등록을
              마친 후 뻔라인과 뻔카드를 확인해보세요.
            </p>
          ) : (
            <p className="h-[40px] mb-[5px] text-[15px] text-[#5E5E88] font-bold">
              카드를 선택하여 자세한 정보를 확인해보세요. <br /> 새로운 멤버가
              카드 등록 시 메일로 알려드립니다.
            </p>
          )}
        </div>

        <div
          className={`z-10 w-full flex flex-col justify-start items-center gap-[16px] pt-[20px] pb-[20px] mb-[24px] ${
            !isProfileRegistered ? "blur-[5px]" : ""
          }`}
        >
          {!isProfileRegistered
            ? dummyCards.map((_, index) => (
                <BusinessCard
                  key={index}
                  name="지니"
                  studentId="20260001"
                  email="example@gm.gist.ac.kr"
                  centerColor="blue"
                  instagramId="@aaa"
                  department="도전탐색과정"
                />
              ))
            : realCards.map((card, index) => (
                <BusinessCard
                  key={index}
                  name={card.name}
                  studentId={card.studentId}
                  email={card.email}
                  centerColor={card.centerColor}
                  instagramId={card.instagramId}
                  department={card.department}
                />
              ))}
        </div>

        <div className="w-full mt-auto pb-[calc(30px+env(safe-area-inset-bottom))] flex flex-col items-center gap-[10px] z-50">
          {!isProfileRegistered ? (
            <Link
              to="/profile"
              className="flex shrink-0 justify-center items-center w-[280px] h-[50px] rounded-[100px] bg-[#9EB6FF] text-[20px] text-white font-bold shadow-lg"
            >
              프로필 등록하기
            </Link>
          ) : (
            <Link
              // 채팅방 만들어지면 연결
              className="flex shrink-0 justify-center items-center w-[280px] h-[50px] rounded-[100px] bg-[#9EB6FF] text-[20px] text-white font-bold shadow-lg"
            >
              채팅방 참여하기
            </Link>
          )}

          <button
            className="text-gray-400 text-xs mb-2"
            onClick={handleLogoutClick}
          >
            테스트용 로그아웃 (토큰/프로필 초기화)
          </button>
        </div>
      </div>
    </div>
  );
}
