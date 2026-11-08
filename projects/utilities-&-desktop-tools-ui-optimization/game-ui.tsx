"use client"

import { useState } from "react"
import { Heart, Zap, Trophy, Coins, Info, ShoppingBag, RotateCcw } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Progress } from "@/components/ui/progress"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"

export default function GameUI() {
  const [health, setHealth] = useState(4)
  const [maxHealth, setMaxHealth] = useState(4)
  const [stamina, setStamina] = useState(100)
  const [score, setScore] = useState(0)
  const [coins, setCoins] = useState(0)
  const [gameOver, setGameOver] = useState(true)
  const [howToPlayOpen, setHowToPlayOpen] = useState(false)

  const startGame = () => {
    setHealth(4)
    setStamina(100)
    setScore(0)
    setGameOver(false)
  }

  return (
    <div className="relative h-screen w-full bg-gradient-to-b from-emerald-800 to-emerald-950 overflow-hidden">
      {/* Background image would go here */}
      <div
        className="absolute inset-0 bg-cover bg-center z-0"
        style={{ backgroundImage: "url('/placeholder.svg?height=1080&width=1920')" }}
      />

      {/* Top HUD */}
      <div className="absolute top-0 left-0 right-0 p-4 flex justify-between items-start z-10">
        <div className="flex flex-col gap-2 bg-black/70 p-3 rounded-lg backdrop-blur-sm">
          <div className="flex items-center gap-2 text-red-500">
            <Heart className="h-5 w-5 fill-red-500" />
            <Progress value={(health / maxHealth) * 100} className="w-24 h-2" />
            <span className="text-white text-sm font-medium">{health}</span>
          </div>
          <div className="flex items-center gap-2 text-yellow-500">
            <Zap className="h-5 w-5 fill-yellow-500" />
            <Progress value={stamina} className="w-24 h-2" />
            <span className="text-white text-sm font-medium">{stamina}</span>
          </div>
          <div className="flex items-center gap-2 text-blue-400">
            <Trophy className="h-5 w-5" />
            <span className="text-white text-sm font-medium">{score}</span>
          </div>
          <div className="flex items-center gap-2 text-amber-400">
            <Coins className="h-5 w-5" />
            <span className="text-white text-sm font-medium">{coins}</span>
          </div>
        </div>

        <div className="flex gap-2">
          <Button variant="outline" className="bg-emerald-600 hover:bg-emerald-700 text-white border-none">
            <ShoppingBag className="h-4 w-4 mr-2" />
            Shop
          </Button>

          <Dialog open={howToPlayOpen} onOpenChange={setHowToPlayOpen}>
            <DialogTrigger asChild>
              <Button
                variant="outline"
                size="icon"
                className="bg-slate-700/80 hover:bg-slate-600 text-white border-none"
              >
                <Info className="h-4 w-4" />
              </Button>
            </DialogTrigger>
            <DialogContent className="bg-gray-900 text-white border-gray-800">
              <DialogHeader>
                <DialogTitle className="text-2xl font-bold text-emerald-400">How to Play</DialogTitle>
              </DialogHeader>
              <div className="space-y-4">
                <ul className="space-y-2">
                  <li className="flex items-start gap-2">
                    <span className="text-emerald-400">•</span>
                    <span>Move: WASD or Arrow Keys</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-emerald-400">•</span>
                    <span>Shoot: Click to fire arrows</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-emerald-400">•</span>
                    <span>Shop: Click shop button to upgrade</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-emerald-400">•</span>
                    <span>Trade: Click on trader to remove 50% of enemies</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="text-emerald-400">•</span>
                    <span>Survive as long as you can!</span>
                  </li>
                </ul>
              </div>
            </DialogContent>
          </Dialog>
        </div>
      </div>

      {/* Game Over Modal */}
      {gameOver && (
        <div className="absolute inset-0 flex items-center justify-center z-20">
          <Card className="w-80 bg-black/80 border-gray-800 backdrop-blur-md text-white">
            <CardHeader className="pb-2">
              <CardTitle className="text-center text-2xl font-bold text-red-500">Game Over</CardTitle>
            </CardHeader>
            <CardContent className="text-center pb-2">
              <p className="text-lg">
                Final Score: <span className="font-bold">{score}</span>
              </p>
            </CardContent>
            <CardFooter className="flex justify-center pt-2">
              <Button onClick={startGame} className="bg-emerald-600 hover:bg-emerald-700 text-white">
                <RotateCcw className="h-4 w-4 mr-2" />
                Play Again
              </Button>
            </CardFooter>
          </Card>
        </div>
      )}

      {/* Game characters would be rendered here */}
      <div className="absolute bottom-20 left-1/4">
        <div className="w-12 h-12 bg-gray-800 rounded-md border-2 border-gray-700"></div>
      </div>
      <div className="absolute bottom-40 right-1/3">
        <div className="w-12 h-12 bg-red-800 rounded-md border-2 border-red-700"></div>
      </div>
      <div className="absolute bottom-10 right-1/4">
        <div className="w-12 h-12 bg-amber-800 rounded-md border-2 border-amber-700"></div>
      </div>
    </div>
  )
}

