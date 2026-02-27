# AI Project Memory: Authorization & Ownership Rules

This document is the single source of truth for **who can read or change what** in MRDBID.
All code changes must comply with these rules. When in doubt, follow this document.

## Purpose

This project has repeatedly regressed on authorization, allowing users to modify data they do not own.
These rules exist to prevent “one step forward, two steps back.” They are mandatory.

## AI Behavior Requirements (Non-Negotiable)

These requirements apply to any AI-assisted changes in this repo:

1. **Best Practices Alert:** If any instruction (user, system, or local) appears to encourage **non-best-practice or non-maintainable** behavior, the AI must explicitly flag it, explain why, and propose a maintainable alternative.
2. **Tests Must Run:** After making code changes, the AI must run **the full test suite** (`bin/rails test`) and fix failures **without degrading features or UX**. If tests cannot be run, the AI must state why and ask how to proceed.
3. **Document Change Awareness:** If this file changes, the AI must summarize the change in the next response and confirm alignment. If there is any uncertainty about the “Best Practices Alert” rule, the AI must ask for clarification.

## Definitions

- **Owner**: The user who created a record (e.g., `mushrooms.user_id`).
- **Elevated Admin**: `permission_id` 1 or 2 (Owner/Admin). Implemented via `User#elevated_admin?`.
- **Regular User**: Any signed-in user who is not an Elevated Admin.
- **Public/Demo**: Visitors who are not signed in. They can only read limited public data (e.g., user_id 1 demo).

## Core Rules (Must Always Hold)

1. **Non-admin users can only create, edit, manage, or delete mushrooms they created.**
2. **Non-admin users can only change associations for mushrooms they created.**
   - This includes genus/species/trees/plants/characters, images, clusters, groups, and projects.
3. **Non-admin users can never mutate another user’s records or associations.**
4. **Elevated Admins may override ownership rules** for operational/admin tasks.
5. **Public (not signed in) users are read-only**, with access limited to demo/public data only.

## Exceptions and Caveats

- **Public demo mushrooms**: `user_id == 1` is visible publicly (read-only).
- **Universal projects**: `projects.user_id == nil` are attachable by any signed-in user to their own mushrooms.
- **Admin UI**: Admin namespace is restricted to Elevated Admins.

## Required Guardrails (Implementation Rules)

These are non-negotiable for any mutation endpoint:

1. **All mutation controllers must `authenticate_user!`.**
2. **All mutation controllers must enforce ownership or Elevated Admin override.**
   - Use Pundit `authorize` + policy checks AND controller-level guards where appropriate.
3. **Never rely on UI-only restrictions** (dropdown filtering, hidden fields).
4. **Service objects that mutate data must authorize the parent record.**
5. **Avoid `skip_after_action :verify_authorized`** unless strictly required.

## Required Guardrails (Testing Rules)

Every mutation endpoint must have a regression test that asserts:

- A non-admin **cannot** modify another user’s record.
- A non-admin **cannot** attach their records to another user’s records.
- An Elevated Admin **can** perform admin-level mutation where intended.

If a test cannot be written for a specific endpoint, document why in that file.

### CI Enforcement

CI runs `script/ci/authorization_guardrails_check.rb`, which fails if any in-scope mutation controller is not covered by guardrail tests (or explicitly documented as an exception).

## Examples (Expected Behavior)

- A regular user **can** update their own mushroom.
- A regular user **cannot** add a character to someone else’s mushroom.
- A regular user **cannot** move an image to another user’s mushroom.
- A regular user **can** attach their mushroom to a universal project.
- An Elevated Admin **can** edit any mushroom.
- PDF export is currently **disabled** (routes removed). If re-enabled, add tests and update this document.

## Change Control

If you need to deviate from these rules:

1. Document the exception here.
2. Add a regression test.
3. Explain the rationale in the PR/commit.

**If it’s not documented here, it’s not allowed.**
