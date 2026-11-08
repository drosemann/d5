import { Authenticated, Unauthenticated, useQuery } from "convex/react";
import { api } from "../convex/_generated/api";
import { SignInForm } from "./SignInForm";
import { SignOutButton } from "./SignOutButton";
import { Toaster } from "sonner";
import { useState } from "react";
import { PhotoStream } from "./PhotoStream";
import { MyPhotos } from "./MyPhotos";

export default function App() {
  const [activeTab, setActiveTab] = useState<"stream" | "my">("stream");

  return (
    <div className="min-h-screen flex flex-col">
      <header className="sticky top-0 z-10 bg-white/80 backdrop-blur-sm p-4 flex justify-between items-center border-b">
        <h2 className="text-xl font-semibold accent-text">PhotoShare</h2>
        <SignOutButton />
      </header>
      <main className="flex-1 flex flex-col p-8">
        <div className="w-full max-w-4xl mx-auto">
          <Content activeTab={activeTab} setActiveTab={setActiveTab} />
        </div>
      </main>
      <Toaster />
    </div>
  );
}

function Content({ 
  activeTab,
  setActiveTab,
}: { 
  activeTab: "stream" | "my";
  setActiveTab: (tab: "stream" | "my") => void;
}) {
  const loggedInUser = useQuery(api.auth.loggedInUser);

  if (loggedInUser === undefined) {
    return (
      <div className="flex justify-center items-center">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-500"></div>
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-8">
      <div className="text-center">
        <h1 className="text-5xl font-bold accent-text mb-4">PhotoShare</h1>
        <Authenticated>
          <div className="flex justify-center gap-4 mb-8">
            <button
              className={`px-4 py-2 rounded ${
                activeTab === "stream"
                  ? "bg-indigo-500 text-white"
                  : "bg-gray-100"
              }`}
              onClick={() => setActiveTab("stream")}
            >
              Stream
            </button>
            <button
              className={`px-4 py-2 rounded ${
                activeTab === "my"
                  ? "bg-indigo-500 text-white"
                  : "bg-gray-100"
              }`}
              onClick={() => setActiveTab("my")}
            >
              My Photos
            </button>
          </div>
          {activeTab === "stream" ? <PhotoStream /> : <MyPhotos />}
        </Authenticated>
        <Unauthenticated>
          <p className="text-xl text-slate-600 mb-8">Sign in to share photos</p>
          <SignInForm />
        </Unauthenticated>
      </div>
    </div>
  );
}
