"use client"

import Image from "next/image"
import Link from "next/link"
import { FC } from "react"
import CinemaAISVG from "../icons/cinemaAI_logo_rounded.webp"

interface BrandProps {
  theme?: "dark" | "light"
}

export const Brand: FC<BrandProps> = ({ theme = "dark" }) => {
  return (
    <Link
      className="flex cursor-pointer flex-col items-center hover:opacity-50"
      href="https://www.chatbotui.com"
      target="_blank"
      rel="noopener noreferrer"
    >
      <div className="mb-2">
        {/* Updated to use the Image component */}
        <Image src={CinemaAISVG} alt="CinemaAI Logo" width={200} height={200} />
      </div>

      <div className="text-4xl font-bold tracking-wide">CinemaAI</div>
    </Link>
  )
}
