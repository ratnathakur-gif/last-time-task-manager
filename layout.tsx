import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Your Name | Technology & Transformation Leader",
  description: "Professional portfolio showcasing technology leadership, Agile delivery and business transformation experience.",
  openGraph: {
    title: "Your Name | Technology & Transformation Leader",
    description: "Turning complex change into meaningful business outcomes.",
    type: "website"
  }
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
