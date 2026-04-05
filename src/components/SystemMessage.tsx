interface SystemMessageProps {
  message: string;
  isStacked?: boolean;
}

export default function SystemMessage({
  message,
  isStacked,
}: SystemMessageProps) {
  return (
    <div
      className={`bg-[#C4CDE0] rounded-[50px] px-[24px] py-[6px] w-fit max-w-[calc(100%-124px)] mx-auto 
      ${isStacked ? "-mt-[12px] mb-[8px]" : "my-[8px]"}`}
    >
      <p className="text-[#FFFFFF] text-[12px] font-bold text-center">
        {message}
      </p>
    </div>
  );
}
