# Security Policy

## Supported Content

This is an educational digital design repository. Security fixes and safety-related documentation updates are handled for the current `main` branch.

Generated Vivado files, archived project files, waveform images, and experiment PDFs are kept for learning and reference. They are not treated as supported software releases.

## Reporting a Vulnerability

If you find a security issue in this repository, please report it responsibly.

- Use GitHub private vulnerability reporting if it is enabled for this repository.
- If private reporting is not available, open a GitHub issue with a short description and avoid posting exploit details, credentials, tokens, or private data.
- Include the affected file or project folder, the risk, and steps to reproduce when safe to share.

## Scope

Relevant reports may include:

- Accidentally committed credentials, tokens, or private keys.
- Unsafe scripts or project files that execute unexpected commands.
- Malicious or suspicious binary/archive contents.
- Documentation that instructs users to perform unsafe setup steps.

Out of scope:

- General HDL design bugs that do not create a security or safety concern.
- Broken simulations, synthesis warnings, or missing documentation.
- Issues in third-party tools such as Vivado or external tutorials.

## Safety Notes

- Do not commit credentials, license files, private bitstreams, or machine-specific secrets.
- Review archived files before sharing or extracting them.
- Prefer source files and reproducible project steps over generated build output when possible.
