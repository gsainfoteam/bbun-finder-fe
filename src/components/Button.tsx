interface ButtonProps {
  label: string;
  onClick?: () => void;
  disabled?: boolean;
}

function Button({ label, onClick, disabled }: ButtonProps) {
  return (
    <button
      type="button"
      onClick={disabled ? undefined : onClick}
      disabled={disabled}
      className={`block mx-auto w-[280px] pt-[16px] pb-[12px] text-[20px] rounded-[100px] font-bold
        ${
          disabled
            ? "bg-[#F8F8F8] text-[#C5C5C5] border border-[#CBCBCB] cursor-not-allowed"
            : "bg-[#9EB6FF] text-[#FFFFFF] active:scale-95 cursor-pointer"
        }`}
    >
      {label}
    </button>
  );
}

export default Button;
