<%@ page import="ds.ChatHistoryArray" %>
<%@ page import="websocket.ChatManager" %>
<%@ page contentType="application/json;charset=UTF-8" %>

<%
    ChatHistoryArray history = ChatManager.history;

    String[] messages = history.getAll();
    out.print("[");

    for (int i = 0; i < messages.length; i++) {
        out.print("\"" + messages[i].replace("\"","\\\"") + "\"");
        if (i != messages.length - 1) out.print(",");
    }

    out.print("]");
%>
