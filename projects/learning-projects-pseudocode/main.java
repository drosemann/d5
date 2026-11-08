// PROCESS CalculateCost
//    INPUT price, quantity
//    SET cost = price * quantity
//    PRINT "The cost is: " + cost
// END

public class main {
    public static void main(String[] args) {
        double price = 10.0; // Example price
        int quantity = 5;    // Example quantity

        double cost = calculateCost(price, quantity);
        System.out.println("The cost is: " + cost);
    }

    public static double calculateCost(double price, int quantity) {
        return price * quantity;
    }
}