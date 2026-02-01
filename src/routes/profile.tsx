import { createFileRoute, useRouter } from "@tanstack/react-router";

export const Route = createFileRoute("/profile")({
  component: ProfilePage,
});

function ProfilePage() {
  const router = useRouter();

  const handleRegisterClick = () => {
    localStorage.setItem("hasProfile", "true");
    router.navigate({ to: "/" });
  };

  return (
    <div className="h-full w-full overflow-y-auto">
      <p>프로필 페이지</p>
      <button
        className="w-[100px] bg-[#9EB6FF] text-white"
        onClick={handleRegisterClick}
      >
        등록
      </button>
    </div>
  );
}
