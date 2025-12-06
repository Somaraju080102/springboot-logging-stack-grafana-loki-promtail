
# 🚀 Spring Boot + Loki + Promtail + Grafana Logging Stack

A complete, production-style containerized **observability stack**.  
Perfect for DevOps learning, interviews, and real-world monitoring setups.

---

## 🏗️ Architecture Diagram

```
                    ┌──────────────────────┐
                    │       Grafana        │
                    │   (Log Visualization)│
                    └───────────▲──────────┘
                                │
                                │ LogQL Queries
                                │
                    ┌───────────┴──────────┐
                    │        Loki           │
                    │ (Log Storage + Index) │
                    └───────────▲──────────┘
                                │
                                │ Push logs
                                │
                    ┌───────────┴──────────┐
                    │      Promtail         │
                    │ (Docker Log Scraper)  │
                    └───────────▲──────────┘
                                │
                                │ Reads container stdout logs
                                │
                    ┌───────────┴──────────┐
                    │   Spring Boot App     │
                    │     (stdout logs)     │
                    └────────────────────────┘
```

---

## 📦 Stack Components

### **1️⃣ Spring Boot Service**
A basic service that prints logs to **stdout**, which Promtail scrapes.

### **2️⃣ Promtail**
- Reads logs from Docker container JSON log files  
- Adds labels  
- Pushes logs to Loki  

### **3️⃣ Loki**
- Stores logs efficiently  
- Indexes labels  
- Supports LogQL  

### **4️⃣ Grafana**
- Visualizes logs  
- Provides Explore UI  
- Supports dashboards  

---

## 🚀 How to Run

```bash
docker compose up --build
```

### Access services:

| Service | URL |
|--------|------|
| Grafana | http://localhost:3000 |
| Loki | http://localhost:3100 |
| Spring app | http://localhost:8080 |

---

## 🔧 Configure Loki in Grafana

1. Open Grafana → **Data Sources**
2. Click **Add Data Source**
3. Select **Loki**
4. Enter:

```
http://loki:3100
```

5. Click **Save & Test**

---

## 🔍 Explore Logs

Go to:

```
Explore → Select Loki datasource
```

Try queries:

```
{job="docker"}
{container_name="spring_service"}
{filename=~".*json.log"}
```

---

## 🗂️ Project Structure

```
logging-stack/
├── docker-compose.yml
├── loki/
│   └── config.yml
├── promtail/
│   └── config.yml
└── spring_service/
    ├── Dockerfile
    └── app.jar  (placeholder)
```

---

## 🛠️ Troubleshooting

### ❌ No logs in Grafana?
- Promtail scrape path wrong  
- Fix by checking:

```bash
docker inspect spring_service | grep LogPath
```

Update Promtail config accordingly.

### ❌ Loki crash?
Usually caused by:
- Wrong config.yml  
- Missing WAL directory  
- Bad volume mount  

---

## ⭐ Summary

This project demonstrates a **real DevOps logging pipeline** using:

✔ Spring Boot  
✔ Promtail  
✔ Loki  
✔ Grafana  

Push this to GitHub — it looks production-quality 🔥  
