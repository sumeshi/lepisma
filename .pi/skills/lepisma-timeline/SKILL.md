---
name: lepisma-timeline
description: Search evidence and update the forensic timeline based on analyst-provided information.
---

Use the `lepisma-search` skill to search for evidence related to the information provided by the analyst.

Use the search results to update `timeline.csv`.

Do not add an event if the same event already exists in the timeline.

Use the following columns:

- `timestamp`: Original timestamp recorded in the source data.
- `timestamp_utc`: Timestamp normalized to UTC (`UTC+00:00`).
- `event_type`: Event classification such as `Logon`, `Logoff`, or `UserAdd`. Use the `lepisma-tag` skill.
- `summary`: Short and objective description of the event. Use the `lepisma-summarize` skill.
- `source_record`: Complete original record used as evidence.
- `source_file`: Source file containing the original record.
- `note`: Additional notes or analyst-provided context.
- `tags`: Keywords used to search and correlate related events. Use the `lepisma-tag` skill.

When the timezone can be determined, normalize the timestamp to UTC and store it in `timestamp_utc`.

Always preserve `source_record` and `source_file`.

Use `-` when a value cannot be determined.
