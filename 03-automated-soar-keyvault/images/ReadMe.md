# Module 03: Automated SOAR Response & Secretless Key Vault Integration

## 📌 Executive Summary
This module implements a zero-trust, automated Security Orchestration, Automation, and Response (SOAR) pipeline designed to handle high-severity telemetry alerts without exposing enterprise credentials. By pairing **Azure Logic Apps** with **Azure Key Vault** and authenticating via **System-Assigned Managed Identities**, this architecture eliminates hardcoded secrets and basic authentication vectors across automated incident response workflows.

---

## 📐 Architecture & Security Design

```text
[ Threat Event Detected ] 
          │
          ▼
[ Logic App Playbook (playbook-rdp-alert) ]
          │ (Authenticates via System-Assigned Managed Identity)
          ▼
[ Azure Key Vault (kv-cloudshield-prod) ]
          │ (Validates RBAC: Key Vault Secrets User)
          ▼
[ Retrieve Secret (AlertNotificationUrl) ] ──> [ Execute Response Action ]
