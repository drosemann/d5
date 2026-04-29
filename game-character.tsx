"use client"

import { useState, useEffect } from "react"
import Image from "next/image"

interface GameCharacterProps {
  type: "player" | "enemy" | "trader"
  position: { x: number; y: number }
  size?: number
}

export default function GameCharacter({ type, position, size = 48 }: GameCharacterProps) {
  const [characterImage, setCharacterImage] = useState("/placeholder.svg")

  useEffect(() => {
    // In a real implementation, you would load the appropriate sprite based on type
    switch (type) {
      case "player":
        setCharacterImage("/placeholder.svg?text=Player")
        break
      case "enemy":
        setCharacterImage("/placeholder.svg?text=Enemy")
        break
      case "trader":
        setCharacterImage("/placeholder.svg?text=Trader")
        break
    }
  }, [type])

  return (
    <div
      className="absolute transition-all duration-200"
      style={{
        left: `${position.x}px`,
        top: `${position.y}px`,
        width: `${size}px`,
        height: `${size}px`,
      }}
    >
      <Image
        src={characterImage || "/placeholder.svg"}
        alt={type}
        width={size}
        height={size}
        className={`object-contain ${type === "enemy" ? "filter-red-500" : ""}`}
      />
    </div>
  )
}

