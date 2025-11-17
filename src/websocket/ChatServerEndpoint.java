package websocket;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class ChatServerEndpoint {

    @OnOpen
    public void onOpen(Session session) {
        // DO NOT ADD USER HERE
        // Wait until real username comes from JOIN:
        System.out.println("New connection: " + session.hashCode());
        ChatManager.sessionMap.put(session.hashCode(), session);
    }

    @OnMessage
    public void onMessage(String msg, Session session) {

        int id = session.hashCode();

        // USER JOIN FLOW
        if (msg.startsWith("JOIN:")) {
            String uname = msg.substring(5);

            // Remove old fake "User-id" entries if they existed
            ChatManager.userList.removeUser(id);

            // Add real user
            ChatManager.userList.addUser(uname, id);

            ChatManager.broadcast("🟢 " + uname + " joined the chat.");
            return;
        }

        // NORMAL CHAT MESSAGE
        ChatManager.broadcast(msg);
    }

    @OnClose
    public void onClose(Session session) {
        int id = session.hashCode();
        String username = ChatManager.userList.getUsernameById(id);

        ChatManager.userList.removeUser(id);
        ChatManager.sessionMap.remove(id);

        if (username != null)
            ChatManager.broadcast("🔴 " + username + " left the chat.");
    }
}
