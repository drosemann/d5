// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/action/DatabaseAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/action/DatabaseAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/action/DatabaseAction.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database.action;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.concurrent.task.Task;
// import net.anweisen.utilities.database.exceptions.DatabaseException;
// import net.anweisen.utilities.database.exceptions.UnsignedDatabaseException;
//
// public interface DatabaseAction {
//    Object execute() throws DatabaseException;
//
//    default Object executeUnsigned() {
//       try {
//          return this.execute();
//       } catch (DatabaseException var2) {
//          throw new UnsignedDatabaseException(var2);
//       }
//    }
//
//    @Nonnull
//    default Task executeAsync() {
//       return Task.asyncCall(this::execute);
//    }
// }
//
