

# 🛡️ Azure CloudShield Portfolio: Enterprise Zero-Trust & Cloud Security

Welcome to the **Azure CloudShield Portfolio** repository! This project demonstrates production-grade Microsoft Azure infrastructure deployment, security engineering, threat hunting, and automated incident response built in accordance with design patterns found in **AZ-104**, **AZ-500**, and **SC-200**.

Rather than isolated lab scenarios, this portfolio models a **progressive security architecture lifecycle**. Each module acts as a building block—establishing isolated network segments, deploying security logging environments, introducing automated orchestration, and culminating in executive-facing visual threat intelligence dashboards.

---

## 📁 Repository Structure

```text
azure-cloudshield-portfolio/
│
├── 01-zero-trust-database/
│   ├── ReadMe.md                         # Module 1 guide
│   ├── queries/
│   │   ├── 01_create_customers.sql       # Schema definition & seed data
│   │   └── 02_test_low_privileged_user.sql # Context switching validation
│   └── images/
│       ├── rg-cloudshield.png            # Resource Group overview
│       ├── public_access_disabled.png    # SQL Server public lockdown
│       ├── private_endpoint_resource.png # Private endpoint configuration
│       ├── Inbound_rules.png             # NSG security rule definitions
│       ├── Role_assigned_SQLSec.png      # IAM security manager role assignment
│       ├── database_navigate.png         # Database security configuration blade
│       ├── add_masking.png               # Dynamic Data Masking setup
│       ├── db_login_blocked.png          # Public block test verification
│       └── Masked.png                    # Query execution masking proof
│
├── 02-sentinel-threat-monitoring/
│   ├── ReadMe.md                         # Module 2 guide
│   ├── queries/
│   │   └── failed_rdp_logons.kql         # KQL audit verification script
│   └── images/
│       ├── create_sentinel.png           # Microsoft Sentinel onboarding
│       ├── defender.png                  # Sentinel overview dashboard
│       ├── vm_configuration.png          # VM honeypot hardware specs
│       ├── data_collection_config.png    # Azure Monitor DCR rules setup
│       ├── add_vm_to_datacollection.png  # DCR scoping definition
│       ├── adding_datasource .png        # Windows Event Log selections
│       ├── adding_destination.png        # Ingestion routing to Log Analytics
│       ├── failed-rdp-logs.png           # Local login failure verification
│       ├── checking_logs.png             # Workspace logging blade
│       ├── event_4625_query.png          # Active telemetry validation
│       └── Navigate_workbooks.png        # Sentinel workbook interface
│
├── 03-automated-soar-keyvault/
│   ├── ReadMe.md                         # Module 3 guide
│   └── images/
│       ├── key_vault_config1.png         # Key Vault deployment configuration
│       ├── kv_iam.png                    # IAM access control blade
│       ├── add_role.png                  # RBAC secrets officer permission assignment
│       ├── secret_generate.png           # Creating new secure secrets
│       ├── create_secret.png             # Secret value registration form
│       ├── confirm_secret.png            # Secret object validation
│       ├── logic_apps.png                # Hosting plan configuration
│       ├── logic_apps_config.png         # Logic App consumption properties
│       ├── add_role_to_logic_apps.png    # Managed identity RBAC assignment
│       ├── logic_designer.png            # Logic App builder workspace
│       ├── http_request.png              # HTTP schema setup
│       ├── add_action.png                # Trigger action workflows
│       ├── get_secret_action.png         # Key Vault connection integration
│       ├── select_secret.png             # Secret parameter binding
│       ├── compose_action.png            # Logging output validation
│       ├── compose_value.png             # Binding Key Vault value output
│       ├── soar-keyvault-execution.png   # Playbook execution success
│       └── logic_app_results.png         # Complete workflow execution history
│
├── 04-sentinel-executive-dashboard/
│   ├── ReadMe.md                         # Module 4 guide
│   ├── queries/
│   │   ├── total_failed_login_attempts.kql # KQL total failure logic
│   │   ├── failed_authentication_attempts.kql # KQL hourly trending analysis
│   │   └── top_targeted_accounts.kql     # KQL target user analysis
│   └── images/
│       ├── defender_workbooks.png        # Sentinel workbook setup
│       ├── remove_blocks.png             # Clean workspace configuration
│       ├── add_on_template.png           # Widget deployment layout
│       ├── title_header_template.png     # Customized title parameters
│       ├── add_datasource.png            # Query block data configuration
│       ├── query.png                     # Step-by-step query entry
│       ├── visualization_config.png      # Tile visualization assignment
│       ├── visualization_config2.png     # Metric parameters configuration
│       ├── failed_authentication_attempts.png # Log volume metrics preview
│       ├── query2.png                    # Hourly attack trend logic
│       ├── visualization_config3.png     # Area chart styling settings
│       ├── rdp_attack_velocity.png       # Velocity graph rendering
│       ├── query3.png                    # Top targeted accounts logic
│       ├── targeted_accounts_attackers.png # Target accounts bar chart
│       ├── save_query_visualization.png  # Workbook directory metadata
│       └── results.png                   # Executed security workspace
│
└── README.md                             # Global overview (This file)
```

---

## 🏗️ Progressive Architecture Lifecycle

This project is built systematically, with each module expanding the capabilities of the overall environment:

```text
  [ Module 1: Zero-Trust Data Segment ]
      └── Sets base isolated Virtual Network (VNet) boundaries and endpoints.
  
  [ Module 2: Sentinel Threat Monitoring & Honeypot ]
      └── Deploys Windows VM in isolated segment; begins ingesting Event Logs into Central LAW.
  
  [ Module 3: Automated SOAR Workflow ]
      └── Connects Logic App playbook to the Sentinel workspace; queries secure Key Vault secrets.
  
  [ Module 4: Sentinel Executive Dashboard ]
      └── Transforms raw security telemetry collected in Module 2 into an interactive workbook.
```

---

## 📂 Portfolio Module Overviews

### [Module 1: Zero-Trust Azure SQL Database](./01-zero-trust-database/)
* **Target Focus:** Network isolation, data classification, and least-privilege security controls (**AZ-500**, **AZ-104**).
* **Core Concepts:** Disables public interface routing on Azure SQL Database, forcing internal access through Private Endpoints mapped inside segmented subnets. Dynamic Data Masking (DDM) is applied to keep Personally Identifiable Information (PII) masked from low-privileged users while remaining transparent to security administrators.

### [Module 2: Sentinel Threat Monitoring & Windows Honeypot](./02-sentinel-threat-monitoring/)
* **Target Focus:** Log collection, VM configuration, and SIEM onboarding (**AZ-104**, **SC-200**).
* **Core Concepts:** Establishes an active security monitoring program. A public-facing Windows Server VM acts as an active honeypot, pulling internet brute-force traffic. Telemetry is collected using Azure Monitor Data Collection Rules (DCR) and ingested directly into Microsoft Sentinel. KQL is used to query failed authentication activities (`Event ID 4625`).

### [Module 3: Automated SOAR Playbook with Key Vault](./03-automated-soar-keyvault/)
* **Target Focus:** Secretless automation and security orchestration (**AZ-500**, **AZ-104**).
* **Core Concepts:** Introduces a automated response workflow using Azure Logic Apps. Utilizing System-Assigned Managed Identities, the Logic App queries secure parameter data stored in Azure Key Vault at runtime without hardcoded keys or values inside the workflow files.

### [Module 4: SOC Executive Security Dashboard](./04-sentinel-executive-dashboard/)
* **Target Focus:** Data visualization, analytical writing, and executive reporting (**SC-200**).
* **Core Concepts:** Aggregates raw security data gathered in Module 2 to construct an executive security dashboard. Using Microsoft Sentinel Workbooks, the parsed log fields are mapped into clean visual elements, detailing total threat telemetry, hourly velocity charts, and targeted accounts.

---

## ⚙️ Shared Cloud Technology Stack

* **Platform Security:** Azure Private Link, Microsoft Entra ID integration, Role-Based Access Control (RBAC), and Private DNS zones.
* **Network Controls:** Virtual Networks (VNet), Subnet Isolation, Network Security Groups (NSG).
* **Threat Detection:** Microsoft Sentinel (SIEM), Log Analytics Workspaces, and Kusto Query Language (KQL).
* **Security Automation:** Azure Logic Apps (SOAR) and Azure Key Vault secret management.
* **Virtualization:** Windows Server 2022 VM deployments, Data Collection Rules (DCR), and Azure Monitor Agents.
