interface DropDownProps {
  value: string;
  onChange: (value: string) => void;
  label?: string;
  placeholder?: string;
  options?: string[];
  disabled?: boolean;
}

function DropDown({
  value,
  onChange,
  label,
  placeholder = "Select an option",
  options = [],
  disabled = false,
}: DropDownProps) {
  return (
    <div className="flex flex-col gap-1">
      <label className="text-[16px] font-bold">{label}</label>
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        disabled={disabled}
        className={`w-full px-4 py-2
          border 
          text-[14px]
          font-bold
          rounded-lg
          focus:outline-none
          focus:ring-2 focus:ring-blue-500
          transition
          cursor-pointer
          ${disabled ? "border-[#8D8D8D] bg-[#EDEDED] cursor-not-allowed" : "border-[#9EB6FF] bg-white "}`}
      >
        <option value="">{placeholder}</option>
        {options.map((option) => (
          <option key={option} value={option}>
            {option}
          </option>
        ))}
      </select>
    </div>
  );
}

export default DropDown;
