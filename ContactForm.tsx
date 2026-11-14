"use client";
import { useState } from "react";
import { Send } from "lucide-react";
import { profile } from "@/data/profile";

export default function ContactForm() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  function submit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const subject = encodeURIComponent(`Portfolio enquiry from ${name}`);
    const body = encodeURIComponent(`Name: ${name}\nEmail: ${email}\n\n${message}`);
    window.location.href = `mailto:${profile.email}?subject=${subject}&body=${body}`;
  }
  return <form onSubmit={submit} className="grid gap-4">
    <div><label className="mb-2 block text-xs font-bold text-slate-600" htmlFor="name">Your name</label><input id="name" required value={name} onChange={e=>setName(e.target.value)} placeholder="Name"/></div>
    <div><label className="mb-2 block text-xs font-bold text-slate-600" htmlFor="email">Email address</label><input id="email" type="email" required value={email} onChange={e=>setEmail(e.target.value)} placeholder="you@example.com"/></div>
    <div><label className="mb-2 block text-xs font-bold text-slate-600" htmlFor="message">Message</label><textarea id="message" required rows={5} value={message} onChange={e=>setMessage(e.target.value)} placeholder="How can we connect?"/></div>
    <button className="btn-primary w-fit" type="submit">Send an enquiry <Send size={15}/></button>
    <p className="text-xs text-slate-500">This opens your email application with the message pre-filled. No form data is stored on this website.</p>
  </form>;
}
