interface ButtonProps {
  label: string;
  onClick?: () => void;
  disabled?: boolean;
  className?: string;
}

function Button({ label, onClick, disabled, className }: ButtonProps) {
  return (
    <button
      type="button"
      onClick={disabled ? undefined : onClick}
      disabled={disabled}
      className={`flex items-center justify-center h-[52px] text-[20px] rounded-[100px] font-bold transition-all
        ${
          disabled
            ? "bg-[#F8F8F8] text-[#C5C5C5] border border-[#CBCBCB] cursor-not-allowed"
            : "bg-[#9EB6FF] text-[#FFFFFF] active:scale-95 cursor-pointer"
        } ${className || "w-[280px] mx-auto"}`}
    >
      {label}
    </button>
  );
}

export default Button;
