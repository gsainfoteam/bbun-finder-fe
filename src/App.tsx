import BusinessCard from "./components/BusinessCard";

function App() {
  return (
    <div className="h-screen flex items-center justify-center bg-gray-100">
      <BusinessCard
        name="지니"
        studentId="20251234"
        email="aaa@gm.gist.ac.kr"
        centerColor="purple"
        issueDate="2025.01.01"
      />
    </div>
  );
}

export default App;
