"use client";

import Link from "next/link";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { api } from "@/lib/axios";

const LoginSchema = z.object({
    email: z.email("Email inválido"),
    password: z.string().min(8, "Mínimo 8 caracteres"),
});
type LoginForm = z.infer<typeof LoginSchema>;

export default function LoginForm() {
    const router = useRouter();
    const [showPwd, setShowPwd] = useState(false);
    const [err, setErr] = useState("");

    const {
        register,
        handleSubmit,
        formState: { errors, isSubmitting },
    } = useForm<LoginForm>({ resolver: zodResolver(LoginSchema) });

    const onSubmit = async (data: LoginForm) => {
        setErr("");
        try {
            await api.post("/auth/login", data); // espera Set-Cookie
            router.replace("/dashboard");
        } catch (e: any) {
            setErr(e?.response?.data?.detail ?? "Error de autenticación");
        }
    };

    return (
        <form onSubmit={handleSubmit(onSubmit)} className="mx-auto max-w-sm space-y-5">
            <header className="text-center space-y-2">
                <h1 className="text-2xl font-semibold tracking-tight">Iniciar sesión</h1>
                <p className="text-sm text-zinc-600 dark:text-zinc-400">
                    Usa tu correo institucional
                </p>
            </header>

            <div className="space-y-1.5">
                <label className="text-sm font-medium">Email</label>
                <input
                    type="email"
                    autoComplete="email"
                    placeholder="@alumnos.udg.mx"
                    {...register("email")}
                    className="w-full h-11 rounded-xl border border-zinc-300 dark:border-white/15 bg-white/80 dark:bg-white/5 px-3 outline-none focus:ring-2 focus:ring-cyan-400"
                />
                {errors.email && <p className="text-xs text-red-600">{errors.email.message}</p>}
            </div>

            <div className="space-y-1.5">
                <label className="text-sm font-medium">Contraseña</label>
                <div className="relative">
                    <input
                        type={showPwd ? "text" : "password"}
                        autoComplete="current-password"
                        placeholder="Contraseña"
                        {...register("password")}
                        className="w-full h-11 rounded-xl border border-zinc-300 dark:border-white/15 bg-white/80 dark:bg-white/5 px-3 pr-10 outline-none focus:ring-2 focus:ring-cyan-400"
                    />
                    <button
                        type="button"
                        onClick={() => setShowPwd((s) => !s)}
                        className="absolute inset-y-0 right-2 my-auto text-xs text-zinc-500 hover:text-zinc-700 dark:hover:text-zinc-300"
                        aria-label={showPwd ? "Ocultar password" : "Mostrar password"}
                    >
                        {showPwd ? "Ocultar" : "Mostrar"}
                    </button>
                </div>
                {errors.password && <p className="text-xs text-red-600">{errors.password.message}</p>}
            </div>

            {err && (
                <p className="text-sm text-red-600 border border-red-200 dark:border-red-900 bg-red-50 dark:bg-red-950/30 rounded-md px-3 py-2">
                    {err}
                </p>
            )}

            <button
                disabled={isSubmitting}
                className="w-full h-11 rounded-xl bg-zinc-900 text-white dark:bg-white dark:text-zinc-900 shadow-sm ring-1 ring-black/10 dark:ring-white/10 transition-transform hover:scale-[1.01] active:scale-[0.99] disabled:opacity-60"
            >
                {isSubmitting ? "Entrando..." : "Entrar"}
            </button>

            <div className="text-sm flex items-center justify-between">
                <Link href="/" className="text-cyan-700 dark:text-cyan-400 hover:underline">
                    Volver al inicio
                </Link>
                <span className="text-zinc-400">·</span>
                <Link href="/auth/register" className="text-emerald-700 dark:text-emerald-400 hover:underline">
                    ¿No tienes cuenta? Regístrate
                </Link>
            </div>
        </form>
    );
}
