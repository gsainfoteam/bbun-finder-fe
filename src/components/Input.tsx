interface InputProps {
  value: string;
  onChange: (value: string) => void;
  label?: string;
  placeholder?: string;
  type?: "text" | "select";
  options?: string[];
}

function Input({
  value,
  onChange,
  label,
  placeholder = "enter your name",
  type = "text",
  options = [],
}: InputProps) {
  if (type === "select") {
    return (
      <div className="flex flex-col gap-1">
        <label className="text-[16px]">{label}</label>
        <select
          value={value}
          onChange={(e) => onChange(e.target.value)}
          className="w-full px-4 py-2
            border border-[#9EB6FF]
            bg-white
            rounded-lg
            focus:outline-none
            focus:ring-2 focus:ring-blue-500
            transition
            cursor-pointer"
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

  return (
    <div className="flex flex-col gap-1">
      <label className="text-[16px]">{label}</label>
      <input
        type="text"
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="w-full px-4 py-2
          border border-[#9EB6FF]
          bg-white
          rounded-lg
          focus:outline-none
          focus:ring-2 focus:ring-blue-500
          transition"
      />
    </div>
  );
}

export default Input;
