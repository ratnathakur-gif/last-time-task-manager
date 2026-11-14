"use client";
import { useState } from "react";
import { Menu, X, ArrowUpRight } from "lucide-react";
import { profile } from "@/data/profile";

const links = [["About", "#about"], ["Experience", "#experience"], ["Expertise", "#expertise"], ["Projects", "#projects"], ["Contact", "#contact"]];

export default function Navigation() {
  const [open, setOpen] = useState(false);
  return <header className="sticky top-0 z-50 border-b border-slate-100 bg-white/95 backdrop-blur">
    <div className="container flex h-[76px] items-center justify-between">
      <a href="#" className="flex items-center gap-3" aria-label="Home">
        <span className="flex h-10 w-10 items-center justify-center rounded-sm bg-ink text-xs font-bold tracking-wider text-white">{profile.initials}</span>
        <span><span className="block text-sm font-bold tracking-wide">{profile.name}</span><span className="block text-[10px] uppercase tracking-[.16em] text-slate-500">Professional Portfolio</span></span>
      </a>
      <nav className="hidden items-center gap-8 md:flex">{links.map(([label, href]) => <a className="nav-link" href={href} key={label}>{label}</a>)}
        <a className="inline-flex items-center gap-1 text-xs font-bold text-ink" href={profile.linkedin} target="_blank" rel="noreferrer">LinkedIn <ArrowUpRight size={14}/></a>
      </nav>
      <button className="md:hidden" onClick={() => setOpen(!open)} aria-label="Toggle navigation">{open ? <X/> : <Menu/>}</button>
    </div>
    {open && <nav className="container grid gap-4 pb-6 md:hidden">{links.map(([label, href]) => <a key={label} className="nav-link" href={href} onClick={() => setOpen(false)}>{label}</a>)}<a className="nav-link" href={profile.linkedin}>LinkedIn ↗</a></nav>}
  </header>;
}
