---
name: krankmeldung-bearbeiten
description: Handle a sick report in Gastro Cockpit and cover the shifts it leaves open. Use when the person says that someone on the team called in sick or cannot come to work ("Anna hat sich krank gemeldet", "Krankmeldung bearbeiten", "Wer kann für Tom einspringen?").
---

Find the person, show what their absence affects and propose a replacement. Never ask for a diagnosis or a
reason, and change nothing without the person's yes.

1. Find the person with `find_employee`.
2. Open sick reports are in `get_inbox`; decide one with `decide_request` only when the person says so. A
   connection without the owner's health-data release shows no sick reports: then say the report is handled in
   the app, and use `get_employee_summary` for the shifts of the next days.
3. Show the affected shifts (`get_day_overview`), propose replacements with `suggest_staff`, and assign with
   `assign_shifts` after the person's yes.
