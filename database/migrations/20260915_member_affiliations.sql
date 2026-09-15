-- Member affiliations belong to a semester, just like fam-head status.
-- Existing rows remain valid and start with no affiliations selected.
ALTER TABLE public.member_semesters
  ADD COLUMN IF NOT EXISTS divisions text[] NOT NULL DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS committees text[] NOT NULL DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS positions text[] NOT NULL DEFAULT '{}';

NOTIFY pgrst, 'reload schema';
