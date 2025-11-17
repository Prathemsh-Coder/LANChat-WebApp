package websocket;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class ChatServerEndpoint {

    @OnOpen
    public void onOpen(Session session) 
    {
        
        System.out.println("New connection: " + session.hashCode());
        ChatManager.sessionMap.put(session.hashCode(), session);
    }

    @OnMessage
    public void onMessage(String msg, Session session)
    {

        int id = session.hashCode();

        
        if (msg.startsWith("JOIN:")) {
            String uname = msg.substring(5);

           
            ChatManager.userList.removeUser(id);

            
            ChatManager.userList.addUser(uname, id);

            ChatManager.broadcast("🟢 " + uname + " joined the chat.");
            return;
        }

        
        ChatManager.broadcast(msg);
    }

    @OnClose
    public void onClose(Session session)
    {
        int id = session.hashCode();
        String username = ChatManager.userList.getUsernameById(id);

        ChatManager.userList.removeUser(id);
        ChatManager.sessionMap.remove(id);

        if (username != null)
            ChatManager.broadcast("🔴 " + username + " left the chat.");
    }
}
