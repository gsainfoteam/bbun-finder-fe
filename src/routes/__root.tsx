import { createRootRoute, Outlet } from "@tanstack/react-router";
import { TanStackRouterDevtools } from "@tanstack/router-devtools";

export const Route = createRootRoute({
  component: RootComponent,
});

function RootComponent() {
  return (
    <>
      <div className="min-h-screen w-full bg-gray-100 flex justify-center">
        <div className="w-full max-w-[430px] h-dvh bg-white shadow-lg overflow-hidden relative">
          <div className="w-full h-full">
            <Outlet />
          </div>
        </div>
      </div>
      <TanStackRouterDevtools />
    </>
  );
}
