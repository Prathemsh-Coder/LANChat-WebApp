package websocket;

import ds.*;
import jakarta.websocket.Session;
import java.io.IOException;
import java.util.HashMap;

public class ChatManager {

    public static UserList userList = new UserList();
    public static MessageQueue queue = new MessageQueue(200);
    public static ChatHistoryArray history = new ChatHistoryArray();

    public static HashMap<Integer, Session> sessionMap = new HashMap<>();

    public static void broadcast(String msg) {
        queue.enqueue(msg);
        history.add(msg);

        for (Session s : sessionMap.values()) {
            try {
                s.getBasicRemote().sendText(msg);
            } catch (IOException ignored) {}
        }
    }
}
