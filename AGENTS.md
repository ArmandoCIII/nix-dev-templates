# AGENTS.md

## Overview

This repository is a general-purpose template resource, designed to provide reusable templates for other projects. It uses Nix as the backbone for reproducibility, integration, and development environment management. The templates here are intended to be adapted and copied into new repositories as needed.

This document is structured for easy ingestion by LLMs and other automated systems.

## Directory Structure

- `ai/` — Machine learning and AI-related templates (Python)
- `backend/` — Backend infrastructure and deployment templates (Nix)
- `frontend/` — Frontend templates (TypeScript, Svelte, Bun)
- `fullstack/` — Fullstack templates combining backend and frontend (Python, TypeScript)
- `generic/` — Generic templates and configuration files
- `documentation/` — Documentation resources (MkDocs)

### Initialization Instructions

- Run `nix flake init` in your project directory.
- Add your agent source files to the appropriate directory (e.g., `ai/python/src`).
- Reference and build agents in your `flake.nix` as shown above.
- Use `nix develop` or `nix build .#agent` to initialize and run your agents.

## Usage Notes

- Agents should be documented with their name, purpose, and main methods.
- Each directory may contain multiple agents or supporting modules.
- Extend the agent template as needed for your stack (Python, TypeScript, etc).

## Updating This Document
## Using as a Nix Flake Template

To bootstrap a new project using this template, run:

```sh
nix flake init --template github:your-org/nix-dev-templates
```
