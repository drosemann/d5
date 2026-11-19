// Goose-Port-Spiegel von: projects/archive-unsorted-helloworld/src/main.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-helloworld/src/main.java");
}

// ---- Original-Code (projects/archive-unsorted-helloworld/src/main.java), unveraendert, als Inline-Doku ----
// import java.io.File;
// import java.io.FileWriter;
// import java.io.IOException;
// import java.util.InputMismatchException;
// import java.util.Scanner;
// import java.util.logging.Level;
// import java.util.logging.Logger;
//
// public class Main {
//
//     private static final Logger logger = Logger.getLogger(Main.class.getName());
//
//     public static void main(String[] args) {
//         logger.log(Level.INFO, "Program started");
//         Scanner scanner = new Scanner(System.in);
//         try {
//             // User Input
//             System.out.print("Enter your name: ");
//             String name = scanner.nextLine();
//             if (name.isEmpty()) {
//                 System.out.println("Name cannot be empty.");
//                 return;
//             }
//             System.out.println("Hello, " + name + "!");
//
//             // Additional User Interaction
//             System.out.print("Enter your age: ");
//             int age = scanner.nextInt();
//             scanner.nextLine(); // Consume newline
//             System.out.println("You are " + age + " years old.");
//
//             // File Operations
//             saveUserData(name, age);
//
//             // Command-Line Arguments
//             if (args.length > 0) {
//                 System.out.println("Command-line arguments:");
//                 for (String arg : args) {
//                     System.out.println(arg);
//                 }
//             } else {
//                 System.out.println("No command-line arguments provided.");
//             }
//
//         } catch (InputMismatchException e) {
//             System.out.println("Invalid input. Please enter a valid number for age.");
//             logger.log(Level.SEVERE, "Invalid input for age", e);
//         } catch (IOException e) {
//             System.out.println("Error writing to file.");
//             logger.log(Level.SEVERE, "File writing error", e);
//         } finally {
//             scanner.close();
//             logger.log(Level.INFO, "Program ended");
//         }
//     }
//
//     private static void saveUserData(String name, int age) throws IOException {
//         File file = new File("userData.txt");
//         try (FileWriter writer = new FileWriter(file, true)) {
//             writer.write("Name: " + name + ", Age: " + age + "\n");
//             System.out.println("User data saved to " + file.getAbsolutePath());
//         }
//     }
//
//     private static void deleteUSerData(String name, int age) throws io.IOException {
//         File file = new File("userData.txt");
//         try (FileWriter writer = new FileWriter(file, true)) {
//             writer.write("Name: " + name + ", Age: " + age + "\n");
//             System.out.println("User data saved to " + file.getAbsolutePath());
//         }
//     }
// }
