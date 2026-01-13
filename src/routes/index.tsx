import { createFileRoute, Link, redirect } from "@tanstack/react-router";

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
  return (
    <div>
      <p>메인 페이지</p>

      <Link to="/profile" className="bg-[#9EB6FF] text-white">
        프로필 등록하기
      </Link>

      {/* 테스트용 로그아웃(토큰 삭제) 버튼*/}
      <button
        className="block mt-10 text-gray-400"
        onClick={() => {
          localStorage.removeItem("accessToken");
          window.location.reload();
        }}
      >
        테스트용 로그아웃(토큰 삭제)
      </button>
    </div>
  );
}
