<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LAN Chat Login</title>

    <style>
        /* ---------- GLOBAL BACKGROUND ---------- */
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #111827, #1e293b, #0f172a, #1d3557);
            background-size: 400% 400%;
            animation: bgAnimation 12s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        @keyframes bgAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* ---------- CARD ---------- */
        .card {
            width: 360px;
            padding: 40px 32px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 18px;
            backdrop-filter: blur(14px);
            box-shadow: 0 10px 35px rgba(0,0,0,0.4);
            text-align: center;
            animation: fadeIn 1s ease both;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        h2 {
            margin-bottom: 15px;
            font-size: 28px;
            font-weight: 600;
        }

        /* ---------- INPUT BOX ---------- */
        .inputBox {
            position: relative;
            margin-top: 30px;
            width: 100%;
        }

        .inputBox input {
            width: 100%;
            padding: 14px 10px;
            border: none;
            outline: none;
            background: transparent;
            border-bottom: 2px solid #888;
            color: #fff !important;
            font-size: 17px;
            transition: .3s;
            caret-color: #00c6ff;
        }

        /* Fix input turning white or black automatically */
        .inputBox input:-webkit-autofill,
        .inputBox input:-webkit-autofill:focus {
            -webkit-text-fill-color: #fff !important;
            caret-color: #fff !important;
            box-shadow: 0 0 0 1000px transparent inset !important;
            transition: background-color 9999s ease-in-out 0s;
        }

        .inputBox label {
            position: absolute;
            left: 0;
            bottom: 12px;
            color: #bbb;
            font-size: 16px;
            pointer-events: none;
            transition: .3s;
        }

        .inputBox input:focus,
        .inputBox input:valid {
            border-bottom-color: #00c6ff;
        }

        .inputBox input:focus ~ label,
        .inputBox input:valid ~ label {
            transform: translateY(-28px);
            font-size: 13px;
            color: #00c6ff;
        }

        /* ---------- BUTTON ---------- */
        button {
            margin-top: 35px;
            width: 100%;
            padding: 14px;
            font-size: 18px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            color: #fff;
            background: linear-gradient(90deg, #00c6ff, #0072ff, #00c6ff);
            background-size: 250%;
            animation: pulse 2s infinite ease-in-out, btnSlide 6s infinite linear;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 10px rgba(0,198,255,0.4); }
            50% { box-shadow: 0 0 20px rgba(0,198,255,0.9); }
            100% { box-shadow: 0 0 10px rgba(0,198,255,0.4); }
        }

        @keyframes btnSlide {
            0% { background-position: 0%; }
            100% { background-position: 200%; }
        }

        button:hover {
            transform: scale(1.06);
        }

    </style>
</head>

<body>

<div class="card">
    <h2>🔐 LAN Chat Login</h2>

    <form action="chat.jsp">
        <div class="inputBox">
            <input type="text" name="user" required autocomplete="off">
            <label>Enter Username</label>
        </div>

        <button type="submit">Join Chat</button>
    </form>
</div>

</body>
</html>
