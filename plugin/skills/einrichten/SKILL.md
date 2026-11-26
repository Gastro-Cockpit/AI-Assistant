---
name: einrichten
description: Help a new business finish its setup in Gastro Cockpit, one step at a time, up to the first published schedule. Use when the person asks what is still missing, how to get started or how to set up the business ("Was fehlt noch?", "Hilf mir beim Einrichten", "Wie fange ich an?").
---

Take the person through the setup, one step at a time.

1. Call `get_context`. Its `setup` lists the open steps in the order of the app's checklist „Deine ersten Schritte“,
   the next one first, and who still lacks wage details. Without `setup` the setup is done: say so in one line.
2. Name the next step in one line and offer to do it. Plan the first week with `prepare_week` and `plan_week`, add
   skills with `manage_areas_skills`, and publish with `publish_week` once the person says yes.
3. Inviting the team, entering wage details and switching on support access happen in the app. Say in one line that
   the app's home shows the same checklist, and name the people who still lack wage details.
4. Before the first month closes, wage details come first: whoever lacks them gets no target hours for that month.
