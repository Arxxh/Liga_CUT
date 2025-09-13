import Link from "next/link";

export default function Home() {
  return (
    <main className="min-h-screen grid place-items-center p-6">
      <div className="flex flex-col gap-4 items-center">
        <h1 className="text-2xl font-bold">Bienvenido a LIGA CUT</h1>
        <p className="text-gray-600">Accede o crea una cuenta</p>
        <div className="flex gap-4">
          <Link
            href="/auth/login"
            className="rounded bg-black text-white px-4 py-2"
          >
            Iniciar sesión
          </Link>
          <Link
            href="/auth/register"
            className="rounded border border-black px-4 py-2"
          >
            Registrarse
          </Link>
        </div>
      </div>
    </main>
  );
}
