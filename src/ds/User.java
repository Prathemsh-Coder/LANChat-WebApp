package ds;

public class User {
    public String username;
    public int socketId;   // maps to WebSocket session hash
    public User next;

    public User(String username, int socketId) {
        this.username = username;
        this.socketId = socketId;
        this.next = null;
    }
}
