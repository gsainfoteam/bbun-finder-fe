import { createFileRoute, useRouter } from "@tanstack/react-router";
import { useState, useRef, useEffect, Fragment, useMemo } from "react";
import MessageBubble from "../components/MessageBubble";
import go_back_black from "../assets/icons/go_back_black.svg";
import SystemMessage from "../components/SystemMessage";
import send from "../assets/icons/send.svg";
import send_disabled from "../assets/icons/send_disabled.svg";

interface ChatMessage {
  id: number;
  type: "system" | "user";
  sender?: string;
  studentId?: string;
  message: string;
  createdAt: string;
  isMe?: boolean;
}

const MOCK_MESSAGES: ChatMessage[] = [
  {
    id: 1,
    type: "system",
    createdAt: "2026-04-01T08:11:59",
    message: "000, 001, 002... 님이 입장하셨습니다.",
  },
  {
    id: 2,
    type: "user",
    sender: "지니",
    studentId: "20250001",
    createdAt: "2026-04-01T08:12:00",
    message: "새해 복 많이 받으세요!! 좋은 하루 되세요.",
    isMe: false,
  },
  {
    id: 3,
    type: "user",
    sender: "지니2",
    studentId: "20240001",
    createdAt: "2026-04-01T08:12:01",
    message: "넹 좋아요",
    isMe: false,
  },
];

export const Route = createFileRoute("/chat")({
  component: RouteComponent,
});

function RouteComponent() {
  const router = useRouter();

  const [messages, setMessages] = useState<ChatMessage[]>(MOCK_MESSAGES);
  const [inputText, setInputText] = useState("");
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const textareaRef = useRef<HTMLTextAreaElement>(null);

  const handleInput = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    setInputText(e.target.value);
    if (textareaRef.current) {
      textareaRef.current.style.height = "auto";
      textareaRef.current.style.height = `${textareaRef.current.scrollHeight}px`;
    }
  };

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const formatTime = (isoString: string) => {
    return new Intl.DateTimeFormat("ko-KR", {
      hour: "2-digit",
      minute: "2-digit",
    }).format(new Date(isoString));
  };

  const formatDate = (isoString: string) => {
    return new Intl.DateTimeFormat("ko-KR", {
      year: "numeric",
      month: "numeric",
      day: "numeric",
    }).format(new Date(isoString));
  };

  const handleSendMessage = () => {
    if (inputText.trim() === "") return;

    const newMessage: ChatMessage = {
      id: Date.now(),
      type: "user",
      sender: "어스",
      studentId: "20260001",
      createdAt: new Date().toISOString(),
      message: inputText,
      isMe: true,
    };

    setMessages((prev) => [...prev, newMessage]);
    setInputText("");

    if (textareaRef.current) {
      textareaRef.current.style.height = "auto";
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
    if (e.key === "Enter" && !e.shiftKey && !e.nativeEvent.isComposing) {
      e.preventDefault();
      handleSendMessage();
    }
  };

  const renderedMessages = useMemo(() => {
    return messages.map((msg, index) => {
      const prevMsg = messages[index - 1];
      const nextMsg = messages[index + 1];

      const prevDateString = prevMsg
        ? new Date(prevMsg.createdAt).toDateString()
        : null;
      const currentDateString = new Date(msg.createdAt).toDateString();
      const nextDateString = nextMsg
        ? new Date(nextMsg.createdAt).toDateString()
        : null;

      const isNewDate = prevDateString !== currentDateString;
      const isSameDateWithPrev = prevDateString === currentDateString;
      const isSameDateWithNext = nextDateString === currentDateString;

      const isSameTimeWithPrev =
        isSameDateWithPrev &&
        !!prevMsg &&
        formatTime(prevMsg.createdAt) === formatTime(msg.createdAt);
      const isSameTimeWithNext =
        isSameDateWithNext &&
        !!nextMsg &&
        formatTime(nextMsg.createdAt) === formatTime(msg.createdAt);

      const isSamePersonWithPrev =
        prevMsg?.type === "user" &&
        msg.type === "user" &&
        prevMsg.studentId === msg.studentId &&
        prevMsg.isMe === msg.isMe;
      const isSamePersonWithNext =
        nextMsg?.type === "user" &&
        msg.type === "user" &&
        nextMsg.studentId === msg.studentId &&
        nextMsg.isMe === msg.isMe;

      const isFirstInGroup = !isSamePersonWithPrev || !isSameTimeWithPrev;
      const isLastInGroup = !isSamePersonWithNext || !isSameTimeWithNext;

      const isConsecutiveSystem =
        msg.type === "system" && prevMsg?.type === "system";

      return {
        ...msg,
        isNewDate,
        isFirstInGroup,
        isLastInGroup,
        isConsecutiveSystem,
      };
    });
  }, [messages]);

  return (
    <div className="w-full h-[100dvh] flex flex-col overflow-hidden">
      <div className="relative h-full w-full bg-blue-200 bg-[linear-gradient(162deg,#D2E4FF,#E9E0FF)] flex flex-col bg-fixed">
        {/* 상단바 */}
        <div className="relative w-full bg-[#E7EEFF] drop-shadow-md flex flex-col z-10 pt-[calc(10px+env(safe-area-inset-top))]">
          <div className="relative w-full h-[57px] flex flex-row items-center justify-between pl-[30px] pr-[30px]">
            <button
              type="button"
              onClick={() => router.navigate({ to: "/" })}
              aria-label="메인 페이지로 이동"
              className="cursor-pointer focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#414177]"
            >
              <img src={go_back_black} alt="" aria-hidden="true" />
            </button>
            <div className="leading-[25px] text-[18px] font-bold">뻔톡방</div>
            <div className="w-[10px] h-[18px]" />
          </div>
        </div>

        {/* 채팅창 */}
        <div className="flex-1 overflow-y-auto scrollbar-hide flex flex-col gap-[16px] px-[12px] py-[20px]">
          {renderedMessages.map((msg) => (
            <Fragment key={msg.id}>
              {msg.isNewDate && (
                <SystemMessage
                  message={formatDate(msg.createdAt)}
                  isStacked={false}
                />
              )}

              {msg.type === "system" ? (
                <SystemMessage
                  message={msg.message}
                  isStacked={msg.isConsecutiveSystem}
                />
              ) : (
                <MessageBubble
                  name={msg.sender ?? ""}
                  studentId={msg.studentId ?? ""}
                  messageSendTime={formatTime(msg.createdAt)}
                  message={msg.message}
                  isMe={msg.isMe ?? false}
                  showProfile={msg.isFirstInGroup}
                  showTime={msg.isLastInGroup}
                />
              )}
            </Fragment>
          ))}
          <div ref={messagesEndRef} />
        </div>

        {/* 입력창 */}
        <div className="relative w-full bg-[#FFFFFF] mt-auto pt-[10px] pb-[calc(10px+env(safe-area-inset-bottom))] px-[20px] flex flex-row items-center justify-center border-t border-[#EFEFEF]">
          <div className="w-full h-full flex flex-row items-center justify-between gap-[18px]">
            <div className="flex-1 bg-[#F8F8F8] rounded-[12px] px-[12px] py-[10px] flex flex-col items-center">
              <textarea
                ref={textareaRef}
                value={inputText}
                onChange={handleInput}
                onKeyDown={handleKeyDown}
                placeholder="메시지를 입력하세요"
                rows={1}
                className="w-full bg-transparent outline-none text-[15px] text-[#161616] placeholder:text-[#161616] resize-none max-h-[96px] overflow-y-auto scrollbar-hide leading-[24px]"
              />
            </div>
            <button
              type="button"
              disabled={!inputText.trim()}
              onClick={handleSendMessage}
              aria-label="메시지 전송"
              className={`w-[22px] h-[22px] ${inputText.trim() ? "cursor-pointer" : "cursor-default"} focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#414177]`}
            >
              <img
                src={inputText.trim() ? send : send_disabled}
                alt=""
                aria-hidden="true"
              />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
