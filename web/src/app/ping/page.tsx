"use client";
import { useEffect, useState } from "react";
import { api } from "@/lib/axios";

export default function PingPage() {
  const [data, setData] = useState<any>(null);
  const [err, setErr] = useState<string>("");

  useEffect(() => {
    api.get("/panel/ping")
      .then(res => setData(res.data))
      .catch(e => setErr(e.message));
  }, []);

  return (
    <div className="p-6 space-y-2">
      <h1 className="text-xl font-semibold">Ping</h1>
      {data && <pre className="text-sm bg-black-100 p-3 rounded">{JSON.stringify(data, null, 2)}</pre>}
      {err && <p className="text-red-600">{err}</p>}
    </div>
  );
}
