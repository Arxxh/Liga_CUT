"use client";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { LoginSchema, type LoginForm } from "@/lib/schemas";
import { api } from "@/lib/axios";
import { useRouter } from "next/navigation";
import { useState } from "react";
import Link from "next/link";

export default function LoginForm() {
    const router = useRouter();
    const [err, setErr] = useState("");
    const { register, handleSubmit, formState: { errors, isSubmitting } } =
        useForm<LoginForm>({ resolver: zodResolver(LoginSchema) });

    const onSubmit = async (data: LoginForm) => {
        setErr("");
        try {
            await api.post("/auth/login", data);
            router.replace("/dashboard");
        } catch (e: any) {
            setErr(e?.response?.data?.detail ?? "Error de autenticación");
        }
    };

    return (
        <form onSubmit={handleSubmit(onSubmit)} className="space-y-3 max-w-sm w-full">
            <h1 className="text-xl font-semibold">Iniciar sesión</h1>
            <input {...register("email")} placeholder="Email" className="w-full border p-2 rounded" />
            {errors.email && <p className="text-red-600 text-sm">{errors.email.message}</p>}
            <input type="password" {...register("password")} placeholder="Password" className="w-full border p-2 rounded" />
            {errors.password && <p className="text-red-600 text-sm">{errors.password.message}</p>}
            {err && <p className="text-red-600 text-sm">{err}</p>}
            <button disabled={isSubmitting} className="w-full h-10 rounded bg-black text-white">
                {isSubmitting ? "Entrando..." : "Entrar"}
            </button>
            <p className="text-sm">¿No tienes cuenta? <Link href="/auth/register" className="underline">Regístrate</Link></p>
            <p className="text-sm">
                <Link href="/" className="underline">Volver al inicio</Link>
            </p>
        </form>
    );
}
