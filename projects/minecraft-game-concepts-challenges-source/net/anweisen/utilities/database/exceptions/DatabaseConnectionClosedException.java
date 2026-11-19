package net.anweisen.utilities.database.exceptions;

public class DatabaseConnectionClosedException extends DatabaseException {
   public DatabaseConnectionClosedException() {
      super("Database connection closed");
   }
}
