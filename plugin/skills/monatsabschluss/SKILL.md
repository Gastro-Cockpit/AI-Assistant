---
name: monatsabschluss
description: Month-end check before payroll in Gastro Cockpit. Use when the person asks what is still open before the payroll, wants to close a month, or asks about missing clock-ins, minijob limits or labor cost against the budget for a month ("Monatsabschluss", "Was fehlt noch für die Lohnabrechnung?").
---

Prepare the month-end for the month the person names, the last month if they name none. Read only: change
nothing unless the person asks for a specific fix.

1. Call `get_context` when it is unclear which location or month is meant.
2. Collect what is open: waiting requests (`get_inbox`), missing clock-ins, minijob limits and labor cost
   against the budget (`get_report`, `get_cost_forecast`).
3. List what has to happen before the payroll, the most urgent first. Correct a recorded time with
   `fix_tracked_time` only when the person asks for that correction.
