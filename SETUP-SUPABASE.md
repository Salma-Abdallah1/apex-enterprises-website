# Apex Enterprises — editable website setup

This is a React + Vite website with a private admin screen and Supabase database/authentication integration. It is designed for phone and desktop screens.

## 1. Create the online database
1. Open https://supabase.com and create a project.
2. In the project, open **SQL Editor**, create a new query, paste the complete contents of `supabase/setup.sql`, and run it.
3. Open **Authentication → Users** and add a user with your own email and a strong password. Do not put a password in website code or share it.
4. Open **Project Settings → API** (or **Connect**) and copy the Project URL and publishable/anon key.

## 2. Configure environment variables
1. Copy `.env.example` to a new file named `.env.local` for local development.
2. Fill in `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` with the project URL and publishable/anon key.
3. Never use a Supabase `service_role` or secret key in frontend code. The anon/publishable key is intended for frontend use with Row Level Security enabled.

## 3. Deploy to Vercel from Android
1. Extract this ZIP with your Android file manager.
2. Upload the extracted project files (the contents, not the ZIP) to a new GitHub repository.
3. Sign in at https://vercel.com, choose **Add New → Project**, and import the repository.
4. Vercel should detect Vite. Build command: `npm run build`; output directory: `dist`.
5. Before deploying, open **Project Settings → Environment Variables** and add the two variables from `.env.local`. Add them for Production (and Preview if desired). Deploy or redeploy after adding them.
6. Open the deployed site and visit `/` for the public homepage or `/#admin` for the admin dashboard.

## 4. Edit content
1. Visit your deployed site's `/#admin` address.
2. Sign in using the email/password you created in Supabase Authentication.
3. Edit homepage text, slogan, about section, services, and contact details, then press **Save changes online**.

## Important security and publishing notes
- Do not enable public sign-ups if only you should edit the site. Create admin users yourself in Supabase.
- The SQL policy permits any authenticated user to edit content. Therefore, keep the Supabase project's user list limited to trusted admins and disable public sign-ups. For multiple users or a public signup flow, replace the broad authenticated policy with a stricter admin-role policy.
- The default contact details and service descriptions are placeholders. Replace them with verified Apex Enterprises information before publishing.
- The logo artwork and abstract hero artwork are CSS-based starter graphics. This package does not include a custom logo image file.
- Supabase is a separate online service; Vercel hosting alone does not store the edits.

## Run locally (optional)
Install Node.js, then run `npm install` and `npm run dev`. This step is optional if you upload to GitHub and deploy directly with Vercel.
