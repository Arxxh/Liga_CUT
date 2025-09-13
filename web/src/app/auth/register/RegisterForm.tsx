"use client";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { RegisterSchema, type RegisterForm } from "@/lib/schemas";
import { api } from "@/lib/axios";
import { useRouter } from "next/navigation";
import { useState } from "react";
import Link from "next/link";

export default function RegisterForm() {
    const router = useRouter();
    const [err, setErr] = useState("");
    const { register, handleSubmit, formState: { errors, isSubmitting } } =
        useForm<RegisterForm>({ resolver: zodResolver(RegisterSchema) });

    const onSubmit = async (data: RegisterForm) => {
        setErr("");
        try {
            await api.post("/auth/register", data);
            router.replace("/auth/login");
        } catch (e: any) {
            setErr(e?.response?.data?.detail ?? "Error al registrar");
        }
    };

    return (
        <form onSubmit={handleSubmit(onSubmit)} className="space-y-3 max-w-sm w-full">
            <h1 className="text-xl font-semibold">Registro</h1>
            <input {...register("email")} placeholder="Email" className="w-full border p-2 rounded" />
            {errors.email && <p className="text-red-600 text-sm">{errors.email.message}</p>}
            <input type="password" {...register("password")} placeholder="Password" className="w-full border p-2 rounded" />
            {errors.password && <p className="text-red-600 text-sm">{errors.password.message}</p>}
            {err && <p className="text-red-600 text-sm">{err}</p>}
            <button disabled={isSubmitting} className="w-full h-10 rounded bg-black text-white">
                {isSubmitting ? "Creando..." : "Registrarme"}
            </button>
            <p className="text-sm">¿Ya tienes cuenta? <Link href="/auth/login" className="underline">Inicia sesión</Link></p>
            <p className="text-sm">
                <Link href="/" className="underline">Volver al inicio</Link>
            </p>
        </form>
    );
}
