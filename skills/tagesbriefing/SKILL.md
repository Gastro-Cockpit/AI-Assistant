---
name: tagesbriefing
description: Daily briefing for a Gastro Cockpit location. Use when the person asks what is going on today or on another day, who is working, where shifts are still open, who is absent or late, which requests are waiting, or how labor cost stands against the target ("Was ist heute los?", "Wer arbeitet morgen?", "Tagesbriefing").
---

Give the daily briefing for the day the person names, today if they name none. Read only: change nothing.

1. Call `get_context` when it is unclear which location or day is meant.
2. Call `get_briefing` for that day. Add `get_day_overview` for the shifts and `get_inbox` for waiting requests
   where the briefing leaves them out, and `get_cost_forecast` for labor cost against the target.
3. Lead with the three points that need the person's attention, then the details: who works, open shifts, who
   is absent (the kind of absence only, never a reason), who is late, waiting requests, labor cost against the
   target.
