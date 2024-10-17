"use client"

import Image from "next/image"
import Link from "next/link"
import { FC } from "react"
import CinemaAISVG from "../icons/logo-sn.png"

interface BrandProps {
  theme?: "dark" | "light"
}

export const Brand: FC<BrandProps> = ({ theme = "dark" }) => {
  return (
    <Link
      className="flex cursor-pointer flex-col items-center hover:opacity-50"
      href="https://gepeto-dpk997ntt-rgimenez1s-projects.vercel.app/"
      target="_blank"
      rel="noopener noreferrer"
    >
      <div className="mb-2">
        {/* Updated to use the Image component */}
        <Image src={CinemaAISVG} alt="CinemaAI Logo" width={200} height={200} />
      </div>

      <div className="text-4xl font-bold tracking-wide">
        Clara da Seminovos, Ruptura 2024
      </div>
    </Link>
  )
}
