package net.anweisen.utilities.database.exceptions;

public class DatabaseAlreadyConnectedException extends DatabaseException {
   public DatabaseAlreadyConnectedException() {
      super("Database already connected");
   }
}
