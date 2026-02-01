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
import snowflake_4 from "../assets/icons/snowflake_4.svg";
import Button from "../components/Button";
import LocalStorageKeys from "../types/localstorage";
import LoadingModal from "../components/LoadingModal";

export const Route = createFileRoute("/")({
  /* 로그인 확인(임시) */
  beforeLoad: () => {
    const isAuthenticated = localStorage.getItem(LocalStorageKeys.AccessToken);
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
    localStorage.removeItem(LocalStorageKeys.AccessToken);
    window.location.reload();
  };

  const dummyCards = [1, 2, 3];

  const realCards = [
    {
      name: "지니",
      id: "20230001",
      email: "example@gist.ac.kr",
      color: "purple",
      issueDate: "2026.01.02",
    },
    {
      name: "어스",
      id: "20240001",
      email: "example@gist.ac.kr",
      color: "orange",
      issueDate: "2026.01.03",
    },
  ];

  return (
    <div className="relative w-full h-full overflow-y-auto scrollbar-hide overflow-x-hidden bg-[linear-gradient(162deg,#D2E4FF,#E9E0FF)]">
      <div className="relative min-h-full w-full flex flex-col justify-start items-center">
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
          className={`z-10 w-full flex flex-col justify-start items-center gap-[16px] pt-[20px] pb-[20px] mb-[35px] ${
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
                  centerColor="newBlue"
                  issueDate="2026.01.01"
                />
              ))
            : realCards.map((card, index) => (
                <BusinessCard
                  key={index}
                  name={card.name}
                  studentId={card.id}
                  email={card.email}
                  centerColor={card.color}
                  issueDate={card.issueDate}
                />
              ))}
        </div>

        <div className="mb-[71px]">
          {!isProfileRegistered ? (
            // <Link
            //   to="/profile"
            //   className="flex shrink-0 justify-center items-center w-[280px] h-[50px] rounded-[100px] mb-[71px] bg-[#9EB6FF] text-[20px] text-white font-bold"
            // >
            //   프로필 등록하기
            // </Link>
            <Button
              label="프로필 등록하기"
              onClick={() => router.navigate({ to: "/profile" })}
            />
          ) : (
            // <Link
            //   // 채팅방 만들어지면 연결
            //   className="flex shrink-0 justify-center items-center w-[280px] h-[50px] rounded-[100px] mb-[71px] bg-[#9EB6FF] text-[20px] text-white font-bold"
            // >
            //   채팅방 참여하기
            // </Link>
            <Button label="채팅방 참여하기" onClick={() => {}} />
          )}
        </div>

        {/* 테스트용 로그아웃 버튼 */}
        <div className="mb-[71px]">
          <Button label="로그아웃" onClick={handleLogoutClick} />
        </div>
      </div>
    </div>
  );
}
