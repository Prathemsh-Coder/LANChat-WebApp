# 🌐 LAN Chat Room – JSP + WebSocket + Custom Data Structures

A real-time LAN-based chat system built using **Java**, **JSP**, and **WebSockets**, supported by fully custom **Data Structures** (Linked List, Queue, Dynamic Array).  
The application works on any devices connected to the **same LAN / Hotspot**, without needing any database or external backend.

---

## 🚀 Features

### 🔥 Real-Time Communication
- WebSocket-based messaging  
- Automatic broadcast to all connected users  

### 🧠 Custom Data Structures
- `UserList` → Singly Linked List  
- `ChatHistoryArray` → Dynamic Array  
- `MessageQueue` → Circular Queue  
- `User` → Node Structure  

### 🎨 Modern UI
- Dark theme  
- Smooth bubble animations  
- Glassmorphism login page  
- Fully mobile responsive  

### 💾 Refresh-Safe Chat History
- Chat history cached in memory  
- Reloading page restores all messages  

### 📱 LAN / Hotspot Support
- Works between **Laptop ↔ Phone ↔ Phone**  
- No router required (mobile hotspot supported)

---

## 🛠️ Tech Stack

| Component | Technology |
|----------|------------|
| Language | Java |
| Frontend | JSP, HTML5, CSS3, JS |
| Backend | Jakarta WebSocket API |
| Server | Apache Tomcat 10.1 |
| Data Structures | Custom Implementations |

---

## 📁 Project Structure (GitHub Version)

```
LANChat-WebApp/
│
├── src/
│   ├── ds/
│   │    ├── User.java
│   │    ├── UserList.java
│   │    ├── MessageQueue.java
│   │    └── ChatHistoryArray.java
│   │
│   └── websocket/
│        ├── ChatManager.java
│        └── ChatServerEndpoint.java
│
├── web/
│   ├── index.jsp
│   ├── chat.jsp
│   └── history.jsp
│
├── WEB-INF/
│   └── web.xml
│
└── README.md
```


## 🧱 Custom Data Structures Overview

### 1️⃣ `UserList` – Linked List
Stores active users connected to WebSocket.

Features:
- Add new user  
- Remove disconnected user  
- Search by WebSocket ID  

---

### 2️⃣ `ChatHistoryArray` – Dynamic Array  
Stores chat messages in memory.

- Resizes automatically  
- Retrieved via `history.jsp` for refresh-safe history  

---

### 3️⃣ `MessageQueue` – Circular Queue  
Optional queue structure for message buffering.

---

## ⚙️ Setup / Installation Guide

Follow these steps to run the chat application.

---

# 🟦 **STEP 1 — Install Tomcat 10.1**

Download from:  
https://tomcat.apache.org/download-10.cgi

Install to:

```
C:\Program Files\Apache Software Foundation\Tomcat 10.1\
```

---

# 🟩 **STEP 2 — Create Deployment Folder**

Inside Tomcat:

```
C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps\LANChat\
```

Place:

```
index.jsp
chat.jsp
history.jsp
WEB-INF/web.xml
```

Also create:

```
WEB-INF/classes/ds
WEB-INF/classes/websocket

```

---

# 🟧 **STEP 3 — Compile Java Source Files Into Tomcat**

Open CMD inside your **source folder**:

```
cd D:\LANChatSource
```

Run this command:

```cmd
javac -cp "C:\Program Files\Apache Software Foundation\Tomcat 10.1\lib\*;." ^
-d "C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps\LANChat\WEB-INF\classes" ^
ds\*.java websocket\*.java
```

This generates:

```
WEB-INF/classes/ds/*.class
WEB-INF/classes/websocket/*.class
```

---

# 🟨 **STEP 4 — Start Tomcat**

Go to:

```
C:\Program Files\Apache Software Foundation\Tomcat 10.1\bin\
```

Run:

```
startup.bat
```

If already running:

```
shutdown.bat
startup.bat
```

---

# 🟫 **STEP 5 — Open in Browser**

Laptop:

```
http://localhost:8080/LANChat/
```

---

# 🟪 **STEP 6 — Connect from Mobile (LAN / Hotspot)**

Find local IP:

```
ipconfig
```

Use:

```
IPv4 Address . . . . : 192.168.x.x
```

On mobile browser:

```
http://192.168.x.x:8080/LANChat/
```

✔ Now mobiles and laptop can chat in real-time.

---

## 🔄 Refresh Behavior

- Chat history **does not disappear**  
- Loaded from `history.jsp` via `ChatHistoryArray`  

---


🔐 Security Notice

This application is intended for LAN / Local Network use only.
It does not use HTTPS or authentication, so it should not be deployed on public internet without additional security layers.


---

## 📝 License

MIT License — free to use and modify.

---
Updated by Prathemsh-Coder
