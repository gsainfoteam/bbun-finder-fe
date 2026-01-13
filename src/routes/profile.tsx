import { createFileRoute } from "@tanstack/react-router";
import BusinessCard from "../components/BusinessCard";

export const Route = createFileRoute("/profile")({
  component: ProfilePage,
});

function ProfilePage() {
  return (
    <div className="h-full w-full overflow-y-auto">
      <p>프로필 페이지</p>
      <BusinessCard
        name="지니"
        studentId="20251234"
        email="helloworld@gm.gist.ac.kr"
        centerColor="newBlue"
        issueDate="2025.01.01"
      />
    </div>
  );
}
