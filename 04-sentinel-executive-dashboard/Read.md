

# Module 04: SOC Executive Security Dashboard (Microsoft Sentinel Workbooks)

In this capstone module, you will build a centralized Security Operations Center (SOC) executive dashboard using Microsoft Sentinel Workbooks. By translating log data into custom metric tiles and charts using Kusto Query Language (KQL), you'll provide visual security insights—such as failed login counts, attack velocity trends, and top targeted accounts.



## 🛠️ Step-by-Step Implementation Guide

### Step 1: Open Microsoft Sentinel Workbooks
1. First, search for **Microsoft Sentinel** and select your active Sentinel workspace. 
2. In the left navigation menu under **Threat management**, click **Workbooks**. 
3. Then click the link to go to **Microsoft Defender**. 
4. Once there, at the top menu bar, click **+ Add workbook** to open a blank canvas.

![Add Workbook](04-sentinel-executive-dashboard/images/defender_workbooks.png)

---

### Step 2: Remove Default Template Elements
1. Click on **Edit** in the top menu bar.
2. Remove the default template widgets by clicking the **`...`** (More options) menu on each block and selecting **remove**.

![Remove Default Blocks](04-sentinel-executive-dashboard/images/remove_blocks.png)

---

### Step 3: Add a Custom Dashboard Header
1. Click on **Add** and then **Add text**.

![Add Text Block](04-sentinel-executive-dashboard/images/add_on_template.png)

2. Add a title header (e.g., `# SOC Executive Security Overview`) and click **Done Editing**.

```markdown
# SOC Executive Security Overview
### Real-Time Incident & Threat Metrics
---
```

![Title Header Template](04-sentinel-executive-dashboard/images/title_header_template.png)

---

### Step 4: Metric Tile – Total Failed Logins
1. Click **+ Add** > **Add data source + visualization** (or **Add query**).

![Add Data Source](04-sentinel-executive-dashboard/images/add_datasource.png)

2. In the query box, add the KQL query for Total Failed Login Attempts (`04-sentinel-executive-dashboard/queries/total_failed_login_attempts.kql`):

```kql
Event
| where EventID == 4625
| summarize FailedLogins = count()
```

![Total Failed Logins Query](04-sentinel-executive-dashboard/images/query.png)

3. Set **Visualization** to **Tiles**.

![Set Tile Visualization](04-sentinel-executive-dashboard/images/visualization_config.png)

4. In tile settings, set the title to **Total Failed Logins**, configure any preferred icons (e.g., Warning), and then click **Done editing**.

![Tile Settings Configuration](04-sentinel-executive-dashboard/images/visualization_config2.png)

---

### Step 5: Visual Chart – Attack Velocity Trends (Hourly)
1. Click **+ Add** and select **Add query**.
2. Input the KQL query to track hourly failed authentication attempts (`04-sentinel-executive-dashboard/queries/failed_authentication_attempts.kql`):

```kql
Event
| where EventID == 4625
| summarize AttackCount = count() by bin(TimeGenerated, 1h)
```

![Attack Velocity Query](04-sentinel-executive-dashboard/images/query2.png)

3. Set the **Visualization** to **Area chart** or **Line chart**. For this example, it is set to **Area Chart**.
4. Name the chart **Attack Velocity Trends (Hourly)** and click **Done Editing**.

![Area Chart Visualization](04-sentinel-executive-dashboard/images/visualization_config3.png)

---

### Step 6: Visual Chart – Top 5 Targeted Accounts
1. Click **+ Add** and select **Add query**.
2. Input the KQL query to aggregate targeted user accounts (`04-sentinel-executive-dashboard/queries/top_targeted_accounts.kql`):

```kql
Event
| where EventID == 4625
| where isnotempty(UserName) and UserName != "N/A"
| summarize Attempts = count() by UserName
| top 5 by Attempts desc
```

> 📝 **Step Context & Query Note:** You may not receive any data from this initially because the data that comes through might have a blank username, which displays as "N/A". In this query, those blank or "N/A" values are explicitly removed to optimize focus for the dashboard.

![Top Targeted Accounts Query](04-sentinel-executive-dashboard/images/query3.png)

3. In **Visualization**, set it to a **Bar chart**.
4. Name the chart **Top 5 Targeted Accounts** and click **Done Editing**.

---

### Step 7: Save and Launch the Interactive Dashboard
1. Lastly, save the workbook. Click the **Save** (floppy disk) icon in the top toolbar.
2. You can name it the same title you configured before (**SOC Executive Security Dashboard**). 
3. Make sure the location and resource group coordinates match your active Log Analytics Workspace.

![Save Query Visualization](04-sentinel-executive-dashboard/images/save_query_visualization.png)

4. Navigate back to **Microsoft Sentinel > Workbooks > My workbooks** to view the saved interactive dashboard.

![Final Executive Dashboard Results](04-sentinel-executive-dashboard/images/results.png)

---

## 🎯 Key Takeaway
This Microsoft Sentinel Workbook acts as the final visual centerpiece of the cloud security portfolio, allowing security teams and executives to monitor active threats and threat vectors in real time.
