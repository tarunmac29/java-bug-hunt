package solutions.easy.bug02;

public class FixedSolution {

    public int sum(int[] numbers) {
        int total = 0;

        for (int i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }

        return total;
    }
}