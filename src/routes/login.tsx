import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { useNavigate } from "@tanstack/react-router";
import { oAuthGetToken, bbunLogin } from "../apis/auth";
import LocalStorageKeys from "../types/localstorage";

type AuthStatus = "loading" | "success" | "failed";

export const Route = createFileRoute("/login")({
  component: RouteComponent,
});

function RouteComponent() {
  const navigate = useNavigate();
  const { authStatus, errorMessage } = useOAuthSequence();
  useEffect(() => {
    if (authStatus === "success") {
      const savedReturnTo = localStorage.getItem(LocalStorageKeys.ReturnTo);
      localStorage.removeItem(LocalStorageKeys.ReturnTo);
      if (savedReturnTo) {
        navigate({ to: savedReturnTo });
      } else {
        navigate({ to: "/" });
      }
    }
  }, [authStatus, navigate]);
  if (authStatus === "loading") {
    return <div>로딩중...</div>;
  }
  if (authStatus === "failed") {
    return (
      <div>
        <p>로그인 실패: {errorMessage}</p>
        <button onClick={() => navigate({ to: "/onboarding" })}>돌아가기</button>
      </div>
    );
  }

  return <div>로그인 성공</div>;
}

const useOAuthSequence = () => {
  const [authStatus, setAuthStatus] = useState<AuthStatus>("loading");
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  useEffect(() => {
    const performOAuthSequence = async () => {
      try {
        const result = await oauthSequence();
        setAuthStatus(result.isSuccessful ? "success" : "failed");
        if (result.errorMessage) {
          setErrorMessage(result.errorMessage);
        }
      } catch (error) {
        console.error("OAuth sequence failed:", error);
        setAuthStatus("failed");
        setErrorMessage("Unknown error");
      }
    };

    performOAuthSequence();
  }, []);

  return {
    authStatus,
    errorMessage,
  };
};

interface OAuthSequenceResult {
  isSuccessful: boolean;
  errorMessage?: string;
}

const oauthSequence = async (): Promise<OAuthSequenceResult> => {
  const urlParams = new URLSearchParams(window.location.search);
  const localState = localStorage.getItem(LocalStorageKeys.OAuthState);
  const state = urlParams.get("state");
  if (!state) {
    return {
      isSuccessful: false,
      errorMessage: "There is no state from OAuth",
    };
  } else if (localState !== state) {
    return {
      isSuccessful: false,
      errorMessage: "State mismatch",
    };
  }
  const code = urlParams.get("code");
  if (!code) {
    return {
      isSuccessful: false,
      errorMessage: "Missing OAuth Code",
    };
  }

  try {
    const currentURL = new URL(window.location.href);
    const tokenResponse = await oAuthGetToken(state, currentURL);

    if (!tokenResponse) {
      return {
        isSuccessful: false,
        errorMessage: "Missing TokenResponse",
      };
    }
    localStorage.removeItem(LocalStorageKeys.OAuthState);
    localStorage.removeItem(LocalStorageKeys.CodeVerifier);
    localStorage.removeItem(LocalStorageKeys.OAuthNonce);
    localStorage.setItem(
      LocalStorageKeys.AccessToken,
      tokenResponse.access_token
    );
    await bbunLogin(); // 만약 백엔드 로그인 부분에 access_token이 필요하다면 bbunLogin2()로 바꾸기
    return {
      isSuccessful: true,
    };
  } catch (error) {
    console.error(error);
    return {
      isSuccessful: false,
      errorMessage: "Unknown error",
    };
  }
};
