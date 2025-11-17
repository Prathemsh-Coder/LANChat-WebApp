package ds;

public class UserList {
    private User head;

    public synchronized void addUser(String name, int socketId) {
        User newUser = new User(name, socketId);
        newUser.next = head;
        head = newUser;
    }

    public synchronized void removeUser(int socketId) {
        User temp = head, prev = null;

        while (temp != null && temp.socketId != socketId) {
            prev = temp;
            temp = temp.next;
        }
        if (temp == null) return;

        if (prev == null) head = temp.next;
        else prev.next = temp.next;
    }

    public synchronized User getHead() {
        return head;
    }

    public String getUsernameById(int id) {
    User temp = head;
    while (temp != null) {
        if (temp.socketId == id) return temp.username;
        temp = temp.next;
    }
    return null;
}

}
