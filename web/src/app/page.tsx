// web/src/app/page.tsx
import Link from "next/link";
import Image from "next/image";

export default function Home() {
  return (
    <main className="min-h-screen bg-gradient-to-b from-zinc-50 to-zinc-200 dark:from-zinc-900 dark:to-black">
      <div className="max-w-2xl mx-auto px-6 py-16">
        {/* Card */}
        <section className="relative rounded-2xl border border-zinc-200/60 dark:border-white/10 bg-white/70 dark:bg-white/5 backdrop-blur-md shadow-lg">
          {/* Glow */}
          <div className="pointer-events-none absolute inset-0 rounded-2xl bg-gradient-to-r from-emerald-300/10 via-cyan-300/10 to-blue-300/10 blur-xl" />

          <div className="relative p-8 sm:p-10 flex flex-col items-center gap-6">
            {/* Logo */}
            <Image
              src="/logo.png"
              alt="Logo Liga CUT"
              width={140}
              height={140}
              className="drop-shadow-sm"
              priority
            />

            {/* Heading */}
            <div className="text-center space-y-2">
              <h1 className="text-3xl font-bold tracking-tight">Bienvenido a Liga CUT</h1>
              <p className="text-zinc-600 dark:text-zinc-400">
                Accede con tu cuenta o crea una nueva para continuar
              </p>
            </div>

            {/* Actions */}
            <div className="flex flex-col sm:flex-row gap-3 w-full sm:w-auto">
              <Link
                href="/auth/login"
                className="inline-flex items-center justify-center rounded-xl px-5 h-11
                           bg-zinc-900 text-white dark:bg-white dark:text-zinc-900
                           shadow-sm ring-1 ring-black/10 dark:ring-white/10
                           transition-transform duration-150 hover:scale-[1.02] active:scale-[0.99]
                           focus:outline-none focus-visible:ring-2 focus-visible:ring-cyan-400"
              >
                Iniciar sesión
              </Link>

              <Link
                href="/auth/register"
                className="inline-flex items-center justify-center rounded-xl px-5 h-11
                           bg-transparent text-zinc-900 dark:text-white
                           border border-zinc-300 dark:border-white/20
                           hover:bg-zinc-100/60 dark:hover:bg-white/10
                           transition-colors duration-150
                           focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-400"
              >
                Registrarse
              </Link>
            </div>

            {/* Divider */}
            <div className="flex items-center gap-3 w-full">
              <div className="h-px flex-1 bg-zinc-200 dark:bg-white/10" />
              <span className="text-xs text-zinc-500">o</span>
              <div className="h-px flex-1 bg-zinc-200 dark:bg-white/10" />
            </div>

            {/* Link rápido a /ping */}
            <Link
              href="/ping"
              className="text-sm text-cyan-700 dark:text-cyan-400 hover:underline"
            >
              Probar conexión /ping
            </Link>
          </div>
        </section>

        {/* Footer */}
        <footer className="mt-8 text-center text-xs text-zinc-500">
          © {new Date().getFullYear()} Liga CUT. Todos los derechos reservados.
        </footer>
      </div>
    </main>
  );
}
