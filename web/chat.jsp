<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String username = request.getParameter("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>LAN Chat – <%= username %></title>

<style>
body {
    margin: 0;
    background: #0f0f0f;
    color: #fff;
    font-family: "Poppins", sans-serif;
    overflow: hidden;
}

.header {
    padding: 15px;
    background: #1b1b1b;
    text-align: center;
    font-size: 22px;
    font-weight: bold;
    position: fixed;
    top: 0;
    width: 100%;
    box-shadow: 0 2px 10px rgba(0,0,0,0.4);
    z-index: 999;
}

#chatBox {
    padding: 20px;
    margin-top: 70px;
    height: calc(100vh - 130px);
    overflow-y: auto;
}

/* Animation for messages */
@keyframes floatIn {
    from { transform: translateY(10px); opacity: 0; }
    to   { transform: translateY(0); opacity: 1; }
}

/* Chat bubbles */
.message {
    max-width: 70%;
    padding: 12px 16px;
    margin: 10px 0;
    border-radius: 18px;
    background: #222;
    animation: floatIn 0.25s ease-out;
}

.self {
    margin-left: auto;
    background: #2d6cff;
    box-shadow: 0 0 12px rgba(45,108,255,0.5);
}

/* System message */
.system-msg {
    background: #333;
    color: #bbb;
    font-size: 14px;
    margin: 10px auto;
    text-align: center;
    width: fit-content;
    padding: 8px 14px;
    border-radius: 14px;
}

/* Input area */
.input-area {
    position: fixed;
    bottom: 0;
    width: 100%;
    padding: 12px;
    display: flex;
    gap: 10px;
    background: rgba(20,20,20,0.95);
    backdrop-filter: blur(12px);
    box-sizing: border-box;
}

#msgInput {
    flex: 1;
    padding: 12px 15px;
    border-radius: 30px;
    border: none;
    outline: none;
    background: #1f1f1f;
    color: #fff;
    font-size: 16px;
}

.send-btn {
    padding: 12px 20px;
    border: none;
    background: #2d6cff;
    color: white;
    font-weight: bold;
    border-radius: 30px;
    cursor: pointer;
    max-width: 90px; /* FIX BUTTON OVERFLOW */
}

.send-btn:hover {
    background: #4d82ff;
    transform: scale(1.05);
}
</style>
</head>

<body>

<div class="header">LAN Chat – <%= username %></div>

<div id="chatBox"></div>

<div class="input-area">
    <input id="msgInput" placeholder="Type message..." autocomplete="off" />
    <button class="send-btn" onclick="sendMsg()">Send</button>
</div>
<script>
let username = "<%= username %>";
let ws;

/* Load chat history from server */
function loadHistory() {
    fetch("history.jsp")
        .then(res => res.json())
        .then(data => {
            let box = document.getElementById("chatBox");

            data.forEach(msg => {
                let div = document.createElement("div");

                if (msg.includes("joined") || msg.includes("left")) {
                    div.classList.add("system-msg");
                } else if (msg.startsWith(username + ":")) {
                    div.classList.add("message", "self");
                } else {
                    div.classList.add("message");
                }

                div.innerText = msg;
                box.appendChild(div);
            });

            box.scrollTop = box.scrollHeight;

            initWebSocket(); // only after history loads
        });
}

function initWebSocket() {
    ws = new WebSocket("ws://" + window.location.host + "/LANChat/chat");

    ws.onopen = () => {
        ws.send("JOIN:" + username);
    };

    ws.onmessage = (event) => {
        let box = document.getElementById("chatBox");
        let msg = event.data;

        let div = document.createElement("div");

        if (msg.includes("joined") || msg.includes("left")) {
            div.classList.add("system-msg");
        } else if (msg.startsWith(username + ":")) {
            div.classList.add("message", "self");
        } else {
            div.classList.add("message");
        }

        div.innerText = msg;
        box.appendChild(div);
        box.scrollTop = box.scrollHeight;
    };
}

function sendMsg() {
    let input = document.getElementById("msgInput");
    let text = input.value.trim();
    if (text.length === 0) return;

    ws.send(username + ": " + text);
    input.value = "";
}

/* ENTER sends */
document.getElementById("msgInput").addEventListener("keydown", function(e) {
    if (e.key === "Enter") {
        e.preventDefault();
        sendMsg();
    }
});

/* Load history first */
loadHistory();
</script>


</body>
</html>
