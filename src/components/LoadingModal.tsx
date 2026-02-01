import { useEffect, useState } from "react";
import skating_icon_Varient3 from "../assets/icons/skating_icon_Varient3.svg";
import skating_icon_Varient4 from "../assets/icons/skating_icon_Varient4.svg";

interface LoadingModalProps {
  label: string;
}

export default function LoadingModal({ label }: LoadingModalProps) {
  const [showFirstIcon, setShowFirstIcon] = useState(true);

  useEffect(() => {
    const interval = setInterval(() => {
      setShowFirstIcon((prev) => !prev);
    }, 500);

    return () => clearInterval(interval);
  }, []);

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50">
      <div className="relative flex w-[224px] h-[167px] flex-col items-center rounded-[20px] bg-white shadow-lg">
        {/* Icon Area */}
        {showFirstIcon ? (
          <img
            src={skating_icon_Varient3}
            alt="Loading Icon 1"
            className="absolute left-[33.5px] top-[27.5px]"
          />
        ) : (
          <img
            src={skating_icon_Varient4}
            alt="Loading Icon 2"
            className="absolute right-[33.5px] top-[27.5px]"
          />
        )}
        
        {/* Label Area */}
        <p className="absolute bottom-[25px] w-full text-center font-bold text-[18px] text-[#414177]">
          {label}
        </p>
      </div>
    </div>
  );
}
