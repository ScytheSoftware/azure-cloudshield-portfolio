# 🛡️ Module 02: Sentinel Threat Monitoring & Native Telemetry Ingestion

## 📌 Overview
This module demonstrates native cloud telemetry collection and threat monitoring in Azure. By deploying the **Azure Monitor Agent (AMA)** and establishing a centralized **Data Collection Rule (DCR)**, raw Windows Security Events from an exposed honeypot virtual machine (`vm-honeypot-pro`) are securely streamed into Log Analytics (`law-cloudshield`) for KQL-based threat hunting.

---

## 🏗️ Architecture & Logging Pipeline

* **Telemetry Source:** Windows Server Virtual Machine (`vm-honeypot-pro`) deployed within `rg-cloudshield-prod`.
* **Agent Architecture:** Azure Monitor Agent (AMA) replacing legacy OMS agents for endpoint monitoring.
* **Ingestion Control:** Centralized Data Collection Rule (`dcr-windows-security-events`) configured to audit Security event streams.
* **SIEM / Log Repository:** Centralized Log Analytics Workspace (`law-cloudshield`).

```text
vm-honeypot-pro (Event Viewer) ──> Azure Monitor Agent (AMA) ──> DCR Filter ──> law-cloudshield (Log Analytics)
