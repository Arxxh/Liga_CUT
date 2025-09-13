import LoginForm from "./LoginForm";

export default function LoginPage() {
    return (
        <main className="min-h-screen bg-gradient-to-b from-zinc-50 to-zinc-200 dark:from-zinc-900 dark:to-black">
            <div className="max-w-2xl mx-auto px-6 py-16">
                <section className="relative rounded-2xl border border-zinc-200/60 dark:border-white/10 bg-white/70 dark:bg-white/5 backdrop-blur-md shadow-lg">
                    <div className="pointer-events-none absolute inset-0 rounded-2xl bg-gradient-to-r from-emerald-300/10 via-cyan-300/10 to-blue-300/10 blur-xl" />
                    <div className="relative p-8 sm:p-10">
                        <LoginForm />
                    </div>
                </section>
            </div>
        </main>
    );
}
