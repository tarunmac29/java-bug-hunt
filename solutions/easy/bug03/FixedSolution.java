package solutions.easy.bug03;

public class FixedSolution {

    public boolean isAdmin(String role) {
        String normalized = role.trim().toUpperCase();
        return normalized.equals("ADMIN");
    }
}
