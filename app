@tailwind base;
@tailwind components;
@tailwind utilities;

:root { --ink: #101b2b; --muted: #647084; --gold: #c6a66b; --line: #e7e9ed; }
* { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body { margin: 0; color: var(--ink); background: #fff; font-family: Arial, Helvetica, sans-serif; }
a { color: inherit; text-decoration: none; }
::selection { background: #e9ddc6; color: var(--ink); }
.container { width: min(1120px, calc(100% - 48px)); margin: 0 auto; }
.section { padding: 96px 0; }
.eyebrow { color: #9a7943; text-transform: uppercase; letter-spacing: .18em; font-size: 11px; font-weight: 700; }
.section-title { font-size: clamp(30px, 4vw, 46px); letter-spacing: -.04em; line-height: 1.08; margin: 14px 0 18px; }
.section-copy { color: var(--muted); line-height: 1.8; max-width: 680px; }
.nav-link { color: #596579; font-size: 13px; transition: color .2s; }
.nav-link:hover { color: var(--gold); }
.btn-primary { display: inline-flex; align-items: center; gap: 10px; padding: 14px 19px; border-radius: 3px; background: var(--ink); color: white; font-size: 13px; font-weight: 700; transition: transform .2s, background .2s; }
.btn-primary:hover { transform: translateY(-2px); background: #22344c; }
.btn-secondary { display: inline-flex; align-items: center; gap: 10px; padding: 13px 18px; border: 1px solid #cfd4dc; border-radius: 3px; font-size: 13px; font-weight: 700; }
.card { border: 1px solid var(--line); background: #fff; border-radius: 5px; padding: 25px; }
.gold-line { width: 42px; height: 2px; background: var(--gold); margin: 20px 0; }
input, textarea { width: 100%; border: 1px solid #dfe3e9; padding: 13px 14px; border-radius: 3px; outline: none; font: inherit; font-size: 14px; }
input:focus, textarea:focus { border-color: var(--gold); }
@media (max-width: 700px) {
 .container { width: min(100% - 34px, 1120px); }
 .section { padding: 68px 0; }
}

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

import { ArrowDown, ArrowUpRight, Download, Mail, MapPin, Linkedin, Target, Users, Layers, BriefcaseBusiness, Award, Sparkles } from "lucide-react";
import Navigation from "@/components/Navigation";
import ContactForm from "@/components/ContactForm";
import { profile } from "@/data/profile";

export default function Home() {
  return <>
    <Navigation/>
    <main>
      <section className="relative overflow-hidden bg-ink text-white">
        <div className="absolute -right-28 -top-32 h-[520px] w-[520px] rounded-full border border-white/10"/><div className="absolute -right-12 -top-16 h-[360px] w-[360px] rounded-full border border-white/10"/>
        <div className="container relative grid min-h-[620px] items-center gap-12 py-20 md:grid-cols-[1.3fr_.7fr]">
          <div>
            <div className="mb-7 inline-flex items-center gap-2 border border-white/20 px-3 py-2 text-[10px] uppercase tracking-[.2em] text-slate-300"><span className="h-1.5 w-1.5 rounded-full bg-gold"/> Professional profile</div>
            <p className="eyebrow">Hello, I’m</p>
            <h1 className="mt-4 max-w-3xl text-5xl font-semibold leading-[1.04] tracking-[-.05em] md:text-7xl">{profile.name}<span className="text-gold">.</span></h1>
            <h2 className="mt-6 text-lg font-medium text-slate-200 md:text-2xl">{profile.role}</h2>
            <p className="mt-5 max-w-2xl text-base leading-8 text-slate-300">{profile.headline} {profile.intro}</p>
            <div className="mt-9 flex flex-wrap gap-3">
              <a className="btn-primary !bg-gold !text-ink" href="#contact">Let’s connect <ArrowUpRight size={15}/></a>
              <a className="btn-secondary !border-white/30 !text-white" href={profile.resumePath} download><Download size={15}/> Download resume</a>
            </div>
            <div className="mt-12 flex flex-wrap gap-6 text-xs text-slate-400"><span className="flex items-center gap-2"><MapPin size={14}/>{profile.location}</span><a className="flex items-center gap-2 hover:text-gold" href={profile.linkedin} target="_blank" rel="noreferrer"><Linkedin size={14}/> LinkedIn profile</a></div>
          </div>
          <div className="mx-auto flex h-64 w-64 items-center justify-center rounded-full border border-white/15 bg-white/[.04] md:h-80 md:w-80">
            <div className="flex h-52 w-52 items-center justify-center rounded-full border border-gold/50 bg-white/[.04] md:h-64 md:w-64"><span className="text-6xl font-light tracking-tight text-gold md:text-7xl">{profile.initials}</span></div>
          </div>
        </div>
        <a href="#about" className="container relative flex items-center gap-3 pb-8 text-[10px] uppercase tracking-[.2em] text-slate-400"><ArrowDown size={14}/> Explore profile</a>
      </section>

      <section id="about" className="section">
        <div className="container grid gap-12 md:grid-cols-[.75fr_1.25fr]">
          <div><p className="eyebrow">01 / About</p><h2 className="section-title">Leadership with purpose. Delivery with impact.</h2><div className="gold-line"/></div>
          <div className="pt-2">{profile.about.map((p,i)=><p key={i} className="mb-5 text-base leading-8 text-slate-600">{p}</p>)}
            <div className="mt-9 grid gap-3 sm:grid-cols-3">{profile.achievements.map((a)=><div key={a.label} className="border-l-2 border-gold pl-4"><div className="text-2xl font-semibold tracking-tight">{a.value}</div><div className="mt-1 text-xs leading-5 text-slate-500">{a.label}</div></div>)}</div>
          </div>
        </div>
      </section>

      <section id="experience" className="section bg-mist">
        <div className="container"><p className="eyebrow">02 / Career journey</p><h2 className="section-title">Professional experience</h2><p className="section-copy">A career shaped by delivery leadership, collaboration and continuous transformation. Replace the sample entries with your verified employment history.</p>
          <div className="mt-12 grid gap-5">{profile.experience.map((job,i)=><article key={i} className="card grid gap-5 md:grid-cols-[180px_1fr]"><div><span className="text-xs font-bold uppercase tracking-wider text-gold">{job.period}</span><div className="mt-3 h-px w-10 bg-gold"/></div><div><h3 className="text-xl font-semibold">{job.title}</h3><p className="mt-1 text-sm font-medium text-slate-500">{job.company}</p><p className="mt-4 text-sm leading-7 text-slate-600">{job.description}</p><ul className="mt-4 grid gap-2">{job.highlights.map((h,j)=><li key={j} className="flex gap-2 text-sm text-slate-600"><span className="mt-2 h-1.5 w-1.5 shrink-0 rounded-full bg-gold"/>{h}</li>)}</ul></div></article>)}</div>
        </div>
      </section>

      <section id="expertise" className="section">
        <div className="container"><p className="eyebrow">03 / Expertise</p><h2 className="section-title">Where I create value</h2><p className="section-copy">A blend of strategic perspective, execution discipline and people-first leadership.</p>
          <div className="mt-10 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">{profile.focusAreas.map((s,i)=><div className="card group transition hover:-translate-y-1 hover:border-gold" key={s}><div className="mb-8 flex h-10 w-10 items-center justify-center bg-[#f6f1e8] text-gold">{[<Target size={18}/>,<Layers size={18}/>,<BriefcaseBusiness size={18}/>,<Users size={18}/>][i%4]}</div><h3 className="text-sm font-bold">{s}</h3><p className="mt-2 text-xs leading-6 text-slate-500">Add a short description of your experience and approach in this area.</p></div>)}</div>
        </div>
      </section>

      <section id="projects" className="section bg-ink text-white">
        <div className="container"><p className="eyebrow">04 / Selected work</p><h2 className="section-title text-white">Projects & transformation</h2><p className="max-w-2xl text-sm leading-7 text-slate-300">Use these case studies to demonstrate how you turn complex challenges into clear outcomes. Keep details appropriate for public sharing.</p>
          <div className="mt-10 grid gap-5 md:grid-cols-2">{profile.projects.map((p,i)=><article key={p.name} className="border border-white/15 bg-white/[.04] p-7"><div className="flex items-center justify-between"><span className="text-[10px] uppercase tracking-[.18em] text-gold">{p.category}</span><span className="text-sm text-slate-500">0{i+1}</span></div><h3 className="mt-5 text-xl font-semibold">{p.name}</h3><div className="mt-6 grid gap-4"><div><p className="text-[10px] font-bold uppercase tracking-wider text-slate-400">Challenge</p><p className="mt-1 text-sm leading-6 text-slate-300">{p.challenge}</p></div><div><p className="text-[10px] font-bold uppercase tracking-wider text-slate-400">Contribution</p><p className="mt-1 text-sm leading-6 text-slate-300">{p.contribution}</p></div><div><p className="text-[10px] font-bold uppercase tracking-wider text-slate-400">Outcome</p><p className="mt-1 text-sm leading-6 text-slate-300">{p.outcome}</p></div></div></article>)}</div>
        </div>
      </section>

      <section className="section">
        <div className="container grid gap-12 md:grid-cols-[.8fr_1.2fr]">
          <div><p className="eyebrow">05 / Credentials</p><h2 className="section-title">Learning that moves me forward.</h2><p className="section-copy">Add professional certifications, leadership programmes, awards and recognitions. Only publish credentials you have earned.</p><div className="gold-line"/></div>
          <div className="grid gap-3">{profile.certifications.map((c,i)=><div key={i} className="flex gap-4 border-b border-slate-200 py-5"><div className="flex h-10 w-10 shrink-0 items-center justify-center bg-[#f6f1e8] text-gold"><Award size={18}/></div><div><h3 className="text-sm font-bold">{c.name}</h3><p className="mt-1 text-xs text-slate-500">{c.issuer} · {c.year}</p></div></div>)}</div>
        </div>
      </section>

      <section id="contact" className="section bg-mist">
        <div className="container grid gap-12 md:grid-cols-[.8fr_1.2fr]">
          <div><p className="eyebrow">06 / Contact</p><h2 className="section-title">Let’s start a conversation.</h2><p className="section-copy">I’m always open to meaningful conversations, collaboration and opportunities to create impact.</p>
            <div className="mt-8 grid gap-4"><a href={`mailto:${profile.email}`} className="flex items-center gap-3 text-sm text-slate-600"><Mail size={17} className="text-gold"/>{profile.email}</a><a href={profile.linkedin} target="_blank" rel="noreferrer" className="flex items-center gap-3 text-sm text-slate-600"><Linkedin size={17} className="text-gold"/>Connect on LinkedIn</a></div>
          </div>
          <div className="card"><ContactForm/></div>
        </div>
      </section>
    </main>
    <footer className="bg-[#0b1421] py-8 text-white"><div className="container flex flex-col justify-between gap-3 text-xs text-slate-400 sm:flex-row"><span>© {new Date().getFullYear()} {profile.name}. All rights reserved.</span><span className="flex items-center gap-2">Built with intention <Sparkles size={13} className="text-gold"/></span></div></footer>
  </>;
}
