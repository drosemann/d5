import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"

export default function Register() {
  return (
    <div className="container mx-auto px-4 mt-10">
      <div className="max-w-md mx-auto">
        <h2 className="text-2xl font-bold mb-6">Register</h2>
        <form className="space-y-4" onSubmit={(e) => e.preventDefault()}>
          <div>
            <label htmlFor="username" className="block text-sm font-medium mb-1">
              Username
            </label>
            <Input
              id="username"
              type="text"
              required
            />
          </div>
          <div>
            <label htmlFor="password" className="block text-sm font-medium mb-1">
              Password
            </label>
            <Input
              id="password"
              type="password"
              required
            />
          </div>
          <Button type="submit" className="w-full">
            Register
          </Button>
        </form>
        <div id="response" className="mt-4" />
      </div>
    </div>
  )
}
