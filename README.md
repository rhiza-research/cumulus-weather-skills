# Cumulus Weather Skills

Skills that fetch the Cumulus AI forecasts as weather-skills Zarrs. Built on
[`weather-skills-core`](https://github.com/weather-skills/weather-skills-core).
Both skills read a private Azure Blob container and need
`AZURE_STORAGE_SAS_TOKEN` (a read SAS with list and read, `sp=rl`).

## Skills

| Skill | Role |
| --- | --- |
| [`cumulus-fetch`](skills/cumulus-fetch/) | Cumulus AI operational ensemble precip (Aurora S2S run) — 30 members, 46 daily leads, 0.25° or 1° global (`--dataset precip`, `precip_1deg`, `precip_era5`), one init or a range of inits → Zarr |
| [`cumulus-downscaled-fetch`](skills/cumulus-downscaled-fetch/) | Cumulus AI downscaled Aurora precip — 0.1° over East and West Africa, 46 daily leads, diffusion / flow-matching / UNet, ensemble mean or 10 members → Zarr |

## Quick start

```bash
uv sync --group dev
uv run pytest

# Latest Cumulus init over Kenya
uv run skills/cumulus-fetch/scripts/fetch.py --bbox 5.5/33.5/-5/42.5 -o /tmp/cumulus_kenya.zarr

# Latest downscaled init, ensemble mean
uv run skills/cumulus-downscaled-fetch/scripts/fetch.py -o /tmp/cumulus_ds.zarr
```

## Install as a Claude plugin

```bash
./install_agent.sh
# or:
claude plugin marketplace add rhiza-research/cumulus-weather-skills
claude plugin install rhiza-cumulus@cumulus-weather-skills
```

## Layout

Canonical skills under `skills/<name>/`, Claude plugin via `.claude-plugin/` +
`agents/`, CLI via `skills-runner`. See [CONTRIBUTING.md](CONTRIBUTING.md).
