import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Foodlibrary Hub — ค้นหาความรู้ภายใน",
  description: "ระบบค้นหาความรู้ภายใน Foodlibrary พร้อมแหล่งอ้างอิงที่ตรวจสอบได้",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="th"><body>{children}</body></html>;
}
