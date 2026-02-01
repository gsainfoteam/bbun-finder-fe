import { createFileRoute, useRouter } from "@tanstack/react-router";
import { useState } from "react";
import snowflake_1 from "../assets/icons/snowflake_1.svg";
import snowflake_4 from "../assets/icons/snowflake_4.svg";
import skating_icon_Default from "../assets/icons/skating_icon_Default.svg";
import Button from "../components/Button";
import Input from "../components/Input";
import BusinessCard from "../components/BusinessCard";

export const Route = createFileRoute("/profile")({
  component: ProfilePage,
});

function ProfilePage() {
  const router = useRouter();
  const [studentId, setStudentId] = useState("");
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [major, setMajor] = useState("");
  const [mbti, setMbti] = useState("");
  const [instagramId, setInstagramId] = useState("");
  const [agreement, setAgreement] = useState(false);

  const mbtiList = [
    "ENFJ",
    "ENFP",
    "ENTJ",
    "ENTP",
    "ESFJ",
    "ESFP",
    "ESTJ",
    "ESTP",
    "INFJ",
    "INFP",
    "INTJ",
    "INTP",
    "ISFJ",
    "ISFP",
    "ISTJ",
    "ISTP",
  ];
  const majorList = [
    "전기전자컴퓨터공학과",
    "AI융합학과",
    "반도체공학과",
    "물리·광과학과",
    "화학과",
    "수리과학과",
    "신소재공학과",
    "기계로봇공학과",
    "환경·에너지공학과",
    "생명과학과",
    "도전탐색과정",
  ];
  const handleRegisterClick = () => {
    if (!studentId.trim() || !name.trim() || !email.trim()) {
      alert("필수 항목(학번, 이름, 이메일)을 모두 입력해주세요.");
      return;
    }
    // localStorage.setItem("hasProfile", "true");
    router.navigate({ to: "/" });
  };

  return (
    <div className="relative w-full h-full overflow-y-auto scrollbar-hide overflow-x-hidden">
      <div className="relative z-0 min-h-full w-full flex flex-col gap-[50px] justify-start items-center bg-[linear-gradient(#D2E4FF_0%,#FFFFFF_33%,#FFFFFF_66%,#E9E0FF_100%)]">
        <img
          className="absolute left-1/2 -translate-x-1/2 ml-[95px] top-[29px] w-[35px] h-[35px] z-[-1]"
          src={snowflake_1}
        />
        <img
          className="absolute left-[36px] bottom-[26px] w-[75px] h-[75px] z-[-1]"
          src={snowflake_4}
        />
        <div className="z-10 relative flex flex-col justify-start items-start gap-[30px] w-[315px] ml-[-5px] mt-[76px] mb-[13px]">
          <div className="flex flex-col gap-[14px]">
            <div className="flex flex-row items-center gap-[10px]">
              <img className="w-[34px] h-[30px]" src={skating_icon_Default} />
              <p className="leading-[36px] text-[25px] text-[#414177] font-bold font-ria">
                내 프로필
              </p>
            </div>
            <p className="h-[40px] text-[15px] text-[#5E5E88] font-bold">
              개인 정보 제공에 동의해야 프로필 설정을 완료하고 서비스를 이용할
              수 있습니다.
            </p>
          </div>
          <div className="flex flex-col gap-[33px]">
            <BusinessCard
              name={name}
              studentId={studentId}
              email={email}
              centerColor="orange"
              issueDate="2026.01.01"
            />
            <div className="flex flex-col gap-[40px]">
              <div className="flex flex-col gap-[19px]">
                <Input
                  value={studentId}
                  label="학번"
                  onChange={(value) => {
                    setStudentId(value);
                  }}
                  placeholder="학번을 입력해주세요."
                />
                <Input
                  value={name}
                  label="이름"
                  onChange={(value) => {
                    setName(value);
                  }}
                  placeholder="이름을 입력해주세요."
                />
                <Input
                  value={email}
                  label="이메일"
                  onChange={(value) => {
                    setEmail(value);
                  }}
                  placeholder="이메일을 입력해주세요."
                />
                <Input
                  value={major}
                  label="학과 (선택)"
                  onChange={(value) => {
                    setMajor(value);
                  }}
                  type="select"
                  options={majorList}
                  placeholder="학과 선택"
                />
                <Input
                  value={mbti}
                  label="MBTI (선택)"
                  onChange={(value) => {
                    setMbti(value);
                  }}
                  type="select"
                  options={mbtiList}
                  placeholder="MBTI 선택"
                />
                <Input
                  value={instagramId}
                  label="인스타그램 아이디(선택)"
                  onChange={(value) => {
                    setInstagramId(value);
                  }}
                  placeholder="인스타그램 아이디를 입력해주세요."
                />
              </div>
              <div className="flex flex-col gap-[10px]">
                <div className="flex flex-col gap-[6px]">
                  <div className="text-[18px] font-bold">
                    개인 정보 제공에 동의하십니까?
                  </div>
                  <div className="text-[12px]">
                    동의하지 않을 시 서비스 이용이 불가능합니다.
                  </div>
                </div>
                <label className="flex items-center gap-[8px] cursor-pointer">
                  <input
                    type="checkbox"
                    checked={agreement}
                    onChange={(e) => setAgreement(e.target.checked)}
                    className="w-5 h-5 cursor-pointer"
                  />
                  <span className="text-[15px] font-bold">동의합니다.</span>
                </label>
              </div>
            </div>
          </div>
        </div>
        <div className="mb-[80px]">
          <Button
            label="등록"
            onClick={handleRegisterClick}
            disabled={
              !agreement || !studentId.trim() || !name.trim() || !email.trim()
            }
          />
        </div>
      </div>
    </div>
  );
}
