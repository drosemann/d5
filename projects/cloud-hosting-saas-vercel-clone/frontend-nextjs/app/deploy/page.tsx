import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Textarea } from "@/components/ui/textarea"

export default function Deploy() {
  return (
    <div className="container mx-auto px-4 mt-10">
      <div className="max-w-2xl mx-auto">
        <h2 className="text-2xl font-bold mb-6">Deploy Your Project</h2>
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
          <div>
            <label htmlFor="projectFiles" className="block text-sm font-medium mb-1">
              Project Files (JSON format)
            </label>
            <Textarea
              id="projectFiles"
              rows={5}
              required
            />
          </div>
          <div>
            <label htmlFor="projectId" className="block text-sm font-medium mb-1">
              Project ID
            </label>
            <Input
              id="projectId"
              type="text"
              required
            />
          </div>
          <div className="flex gap-2">
            <Button variant="secondary" type="button">
              Backup Project
            </Button>
            <Button variant="destructive" type="button">
              Restore Project
            </Button>
            <Button type="submit">
              Deploy
            </Button>
          </div>
        </form>
        <div id="response" className="mt-4" />
      </div>
    </div>
  )
}
