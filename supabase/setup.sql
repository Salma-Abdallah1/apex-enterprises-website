-- Run this in Supabase SQL Editor after creating your Supabase project.
create table if not exists public.site_content (
  id bigint primary key check (id = 1),
  content jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.site_content enable row level security;
-- Public visitors can read the published website content.
drop policy if exists "Public can read site content" on public.site_content;
create policy "Public can read site content" on public.site_content for select using (true);
-- Only signed-in users can save website content. Only create trusted admin accounts.
drop policy if exists "Authenticated admins can update site content" on public.site_content;
create policy "Authenticated admins can update site content" on public.site_content for all to authenticated using (true) with check (true);
insert into public.site_content (id, content) values (1, '{"company":"APEX ENTERPRISES","eyebrow":"IDEAS. SKILLS. OPPORTUNITIES.","title":"Turning Ideas Into Impact","subtitle":"We help people and organizations explore ideas, build skills, and create practical opportunities through technology, learning, and collaboration.","slogan":"Idea + Action + Learning = Progress","aboutTitle":"About Apex Enterprises","about":"Apex Enterprises brings together ideas, learning, and action to support innovation and meaningful progress. Update this description to reflect your company’s official story.","email":"info@apexenterprises.com","phone":"+252 61 000 0000","location":"Mogadishu, Somalia","services":[{"title":"Technology Solutions","text":"Web and mobile applications, digital tools, and technology projects.","icon":"monitor"},{"title":"Apex Academy","text":"Training, workshops, and digital skills learning programs.","icon":"graduation"},{"title":"Business Support","text":"Idea development, mentorship, and business growth support.","icon":"growth"},{"title":"Events & Community","text":"Webinars, learning events, and innovation programs.","icon":"megaphone"}]}'::jsonb) on conflict (id) do nothing;
