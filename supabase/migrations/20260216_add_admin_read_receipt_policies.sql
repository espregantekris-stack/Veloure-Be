-- Allow admin accounts to read all customer order receipts.
-- Admin role source: auth.users.user_metadata.role = 'admin'

drop policy if exists "Admins can read all orders" on public.orders;
create policy "Admins can read all orders"
on public.orders
for select
to authenticated
using (
  (auth.jwt() -> 'user_metadata' ->> 'role') = 'admin'
);

drop policy if exists "Admins can read all order items" on public.order_items;
create policy "Admins can read all order items"
on public.order_items
for select
to authenticated
using (
  (auth.jwt() -> 'user_metadata' ->> 'role') = 'admin'
);

