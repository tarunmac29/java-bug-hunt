package solutions.easy.bug01;

public class FixedSolution {

    public String greet(String name) {
        String greet = (name == null) ? "guest" : name;
        return "Hello, " + greet.toUpperCase() + "!";
    }
}