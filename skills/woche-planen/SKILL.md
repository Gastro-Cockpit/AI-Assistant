---
name: woche-planen
description: Plan a week's schedule in Gastro Cockpit with as little work for the person as possible. Use when the person asks to plan, fill or prepare a week, to fill open shifts, or to publish the schedule ("Plan mir die nächste Woche", "Woche planen", "Fülle die offenen Schichten").
---

Plan the week the person names, the week from next Monday if they name none. Do as much as possible yourself
and ask once.

1. Call `get_week_overview` for the week. If it is still empty, copy the previous week's shifts with
   `prepare_week`.
2. Fill the open shifts with `plan_week`. It returns a proposal and writes nothing yet. Use `suggest_staff`,
   `assign_shifts` or `edit_schedule` only for what the person changes by hand.
3. Show briefly who works when and which shifts stay open, then ask once whether to enter the plan. On a yes,
   call `plan_week` again with `confirm=true` and the proposal's id.
4. Publish with `publish_week` only when the person says so; staff see the week only after that.
