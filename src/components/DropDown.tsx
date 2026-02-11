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
          border border-[#9EB6FF]
          text-[14px]
          font-bold
          rounded-lg
          focus:outline-none
          focus:ring-2 focus:ring-blue-500
          transition
          cursor-pointer
          ${disabled ? "bg-gray-100 cursor-not-allowed opacity-70" : "bg-white"}`}
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
