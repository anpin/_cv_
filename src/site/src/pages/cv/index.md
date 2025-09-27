---
title: Pavel Anpin - CV
description: CV of Pavel Anpin.
layout: ../../layouts/Minimalist.astro
pdfLink: "/pavel_anpin_cv.pdf"
publickey: "/publickey.asc"
sidebar:
  photo:
    alt: "Portrait placeholder for Pavel Anpin"
    initials: "PA"
    src: "/photo.jpg"
---

# Pavel Anpin
**Software Engineer | Reproducible Distributed Systems | IoT**

[Email:pavel@anpin.fyi](mailto:pavel@anpin.fyi) | [Website: anpin.fyi](https://anpin.fyi) | [GitHub: anpin](https://github.com/anpin) | [Matrix: @anpin:matrix.org](https://matrix.to/#/@anpin:matrix.org) | [LinkedIn](https://www.linkedin.com/in/pavel-anpin/)

## Summary
Senior Software Engineer with 10+ years building distributed .NET systems in F# and C#. Experienced in event-driven platforms, CQRS, and reproducible infrastructure. Knowledgeable in all aspects of software development, including backend, frontend, and cloud, delivering maintainable, production-ready solutions.

## Skills
- **Languages:** F#, C#, SQL,  C++, Rust, Lua, Bash, PowerShell
- **Backend:** Akka.NET, Giraffe, ASP.NET Core, gRPC, REST/HATEOAS, WebSockets, SignalR, WebRTC, OAuth2/OIDC, SSO/SAML, RBAC, TLS, GPG, YubiKey, SOPS, xUnit, NUnit, FsCheck, Expecto, OpenTelemetry, CQRS/Event Sourcing, Domain-Driven Design (DDD)
- **Frontend:** Fable, Sutil, Avalonia, MAUI/Xamarin.Forms, WPF, SkiaSharp, TailwindCSS/DaisyUI, HTMX, Astro, Next.js
- **DevOps:** Nix, Docker/OCI, CI/CD pipelines (GitHub Actions, Azure DevOps, etc), compiler tooling (CMAKE, MSBuild, FAKE etc.), git, integration & hardware-in-the-loop testing
- **Infra:**  NixOS, Linux, Azure, AWS, Kubernetes, Nomad, Proxmox, QEMU, Firecracker, Ceph, MinIO, nginx, Authentik, PostgreSQL/TimescaleDB, Kafka, ClickHouse, Redis, MQTT, RabbitMQ, Grafana

## Work Experience

### [Alerio](https://alerio.net/?ref=anpin.fyi)
#### Technical Founder | Dec 2022 - Present
- Shipped real-time building control and monitoring platform for incidents, energy usage, and costs.
- Prototyped a C# solution, gathered market and customer feedback and turned it into a full-stack F# platform (Giraffe/ASP.NET Core, Akka.NET, SignalR, Fable, HTMX, Vega, TimescaleDB/PostgreSQL).
- Implemented reproducible, declarative infrastructure with Nix/NixOS and a self-hosted stack (Grafana, ClickHouse, Forgejo, Authentik).
- Built DSL for efficient hardware integration, runtime module registration from text files, automation rules and data pipelines.
- Implemented reactive graph visualization for arbitary data from modules: 50000 sparse datapoints loaded in less than 5 seconds in a WebGL rendered graph. 
- Implemented offline-first voice control over WebRTC for on-prem devices with self-hosted STT/TTS/LLM pipeline for user intent recognition and response, including smart speaker firmware for ESP32.
- Built automated build/publish pipeline for product website, enabling A/B testing of marketing materials.

### [Independent Contractor](https://anpin.fyi)
#### Self-employed | Dec 2016 - Present
Delivered and maintained bespoke cross-platform native apps (Xamarin.Forms/MAUI, Avalonia), full-stack web services (ASP.NET Core, Giraffe, Akka.NET) and embeded firmware (ESP-IDF, Rust), implemented CI/CD pipelines, and migrated client systems from .NET Framework/C# to dotnet8/F# using Akka.NET, Giraffe, and Avalonia-improving maintainability and scalability. Highlights:
- Velonetic: Presentation room control system with custom CMS for Tizen signage, real-time web control, scheduling, transcoding, and integration with Crestron/Biamp/Dante. Reproducible builds with NixOS and deployment CI/CD integration testing.
- BrightlinkAV: original ASP.NET + XF app, migration to MAUI and .NET Core, Azure cloud deployment, and CI/CD automation for app publishing.
 
### Open Source Contributions
- [Ported](https://github.com/akkadotnet/Akka.Management/pull/3365) Akka.NET Management DNS-based service discovery from Scala Akka.
- Maintainer/contributor to [nixos/nixpkgs](https://github.com/NixOS/nixpkgs/pulls?q=author%3Aanpin)
- Authored a popular MAUI/Xamarin.Forms [context menu plugin](https://github.com/anpin/ContextMenuContainer) with >60 **★**.

### Past Programming & Engineering Roles
#### 2013–2017
Progressed from intern to Chief Engineer across [8 Ohm Ltd](https://8ohm.ru/), [AudioVideoSystems Ltd](https://audioprofi.ru/), and [IMS Group Ltd](https://www.facebook.com/imsgroup.pro/), designing and programming audiovisual control systems (C#, Lua, Netlinx, DSP, network configuration, rack assembly, and commissioning).

## Education

### Siberian State University of Telecommunications and Information Science
##### Engineer's degree, Audio Visual Technologies | Sep 2009 - Jun 2014 (5 yrs)
#### Graduation Work: Project of audiovisual complex for universal hall in the hotel "Hermitage" in the city of Yekaterinburg

## Languages
English: Bilingual/Fluent, Russian: Native, Portuguese: basic

## Location 
Currently based in Rio de Janeiro, Brazil. Open to relocation and remote positions.