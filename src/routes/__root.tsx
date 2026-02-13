import { createRootRoute, Outlet, redirect } from "@tanstack/react-router";
import { TanStackRouterDevtools } from "@tanstack/router-devtools";
import LocalStorageKeys from "../types/localstorage";

export const Route = createRootRoute({
  beforeLoad: ({ location }) => {
    const isAuthenticated = localStorage.getItem(LocalStorageKeys.AccessToken);

    const publicPaths = ["/onboarding", "/auth"];
    const isPublicPath = publicPaths.some((path) =>
      location.pathname.startsWith(path),
    );

    if (!isAuthenticated && !isPublicPath) {
      throw redirect({
        to: "/onboarding",
      });
    }

    if (isAuthenticated && isPublicPath) {
      throw redirect({
        to: "/",
      });
    }
  },
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
    </>
  );
}
