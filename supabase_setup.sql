-- RUTİN için Supabase SQL Editor'de çalıştır.
-- Kullanıcı başına tek satır; tüm kayıtlar RLS ile kullanıcıya özel.
create table if not exists public.rutin_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.rutin_data enable row level security;

drop policy if exists "Users can read own RUTIN data" on public.rutin_data;
create policy "Users can read own RUTIN data"
on public.rutin_data for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert own RUTIN data" on public.rutin_data;
create policy "Users can insert own RUTIN data"
on public.rutin_data for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update own RUTIN data" on public.rutin_data;
create policy "Users can update own RUTIN data"
on public.rutin_data for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

grant select, insert, update on public.rutin_data to authenticated;
