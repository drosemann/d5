// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/challenges/ChallengeManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/challenges/ChallengeManager.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/challenges/ChallengeManager.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.challenges;
//
// import java.util.Collection;
// import java.util.Collections;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.function.Predicate;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.config.FileDocument;
// import net.anweisen.utilities.common.config.document.GsonDocument;
// import net.anweisen.utilities.common.config.document.wrapper.FileDocumentWrapper;
// import net.anweisen.utilities.database.exceptions.DatabaseException;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.custom.CustomChallenge;
// import net.codingarea.challenges.plugin.challenges.type.IChallenge;
// import net.codingarea.challenges.plugin.challenges.type.IGoal;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import net.codingarea.challenges.plugin.management.challenges.entities.GamestateSaveable;
// import org.bukkit.entity.Player;
//
// public final class ChallengeManager {
//    private final List challenges = new LinkedList();
//    private final List additionalSaver = new LinkedList();
//    private IGoal currentGoal;
//
//    @Nonnull
//    public List getChallenges() {
//       return Collections.unmodifiableList(this.challenges);
//    }
//
//    public void registerGameStateSaver(@Nonnull GamestateSaveable savable) {
//       this.additionalSaver.add(savable);
//    }
//
//    public void register(@Nonnull IChallenge challenge) {
//       if (!challenge.getType().isUsable()) {
//          throw new IllegalArgumentException("Invalid MenuType");
//       } else {
//          this.challenges.add(challenge);
//       }
//    }
//
//    public void unregister(@Nonnull IChallenge challenge) {
//       this.challenges.remove(challenge);
//    }
//
//    public void unregisterIf(@Nonnull Predicate predicate) {
//       this.challenges.removeIf(predicate);
//    }
//
//    public void shutdownChallenges() {
//       Iterator var1 = this.challenges.iterator();
//
//       while(var1.hasNext()) {
//          IChallenge challenge = (IChallenge)var1.next();
//
//          try {
//             challenge.handleShutdown();
//          } catch (Exception var4) {
//             Logger.error("Could not handle shutdown for {}", challenge.getClass().getSimpleName(), var4);
//          }
//       }
//
//    }
//
//    public void clearChallengeCache() {
//       this.challenges.clear();
//       this.currentGoal = null;
//    }
//
//    public void restoreDefaults() {
//       Logger.debug("Restoring default settings..");
//       Challenges.getInstance().getCustomChallengesLoader().resetChallenges();
//       Iterator var1 = this.challenges.iterator();
//
//       while(var1.hasNext()) {
//          IChallenge challenge = (IChallenge)var1.next();
//
//          try {
//             challenge.restoreDefaults();
//          } catch (Exception var4) {
//             Logger.error("Could not restore defaults for {}", challenge.getClass().getSimpleName(), var4);
//          }
//       }
//
//    }
//
//    public void saveSettings(@Nonnull Player player) throws DatabaseException {
//       Document document = new GsonDocument();
//       this.saveSettingsInto(document);
//       Challenges.getInstance().getDatabaseManager().getDatabase().insertOrUpdate("challenges").where("uuid", (Object)player.getUniqueId()).set("config", document).execute();
//    }
//
//    public void saveCustomChallenges(@Nonnull Player player) throws DatabaseException {
//       Document document = new GsonDocument();
//       this.saveCustomChallengesInto(document);
//       Challenges.getInstance().getDatabaseManager().getDatabase().insertOrUpdate("challenges").where("uuid", (Object)player.getUniqueId()).set("custom_challenges", document).execute();
//    }
//
//    public void enable() {
//       this.loadGamestate(Challenges.getInstance().getConfigManager().getGamestateConfig().readonly());
//       this.loadSettings(Challenges.getInstance().getConfigManager().getSettingsConfig().readonly());
//       this.loadCustomChallenges(Challenges.getInstance().getConfigManager().getCustomChallengesConfig().readonly());
//    }
//
//    public synchronized void loadSettings(@Nonnull Document config) {
//       Iterator var2 = this.challenges.iterator();
//
//       while(var2.hasNext()) {
//          IChallenge challenge = (IChallenge)var2.next();
//          if (!(challenge instanceof CustomChallenge)) {
//             String name = challenge.getUniqueName();
//             if (config.contains(name)) {
//                try {
//                   Document document = config.getDocument(name);
//                   challenge.loadSettings(document);
//                } catch (Exception var6) {
//                   Logger.error("Could not load setting for challenge {}", challenge.getClass().getSimpleName(), var6);
//                }
//             }
//          }
//       }
//
//    }
//
//    public synchronized void loadGamestate(@Nonnull Document config) {
//       LinkedList list = new LinkedList(this.challenges);
//       list.addAll(this.additionalSaver);
//       Iterator var3 = list.iterator();
//
//       while(var3.hasNext()) {
//          GamestateSaveable challenge = (GamestateSaveable)var3.next();
//          String name = challenge.getUniqueGamestateName();
//          if (config.contains(name)) {
//             try {
//                Document document = config.getDocument(name);
//                challenge.loadGameState(document);
//                if (challenge instanceof AbstractChallenge) {
//                   AbstractChallenge abstractChallenge = (AbstractChallenge)challenge;
//                   if (abstractChallenge.getBossbar().isShown()) {
//                      abstractChallenge.getBossbar().update();
//                   }
//
//                   if (abstractChallenge.getScoreboard().isShown()) {
//                      abstractChallenge.getScoreboard().update();
//                   }
//                }
//             } catch (Exception var8) {
//                Logger.error("Could not load gamestate for {}", challenge.getClass().getSimpleName(), var8);
//             }
//          }
//       }
//
//    }
//
//    public synchronized void loadCustomChallenges(@Nonnull Document config) {
//       Challenges.getInstance().getCustomChallengesLoader().loadCustomChallengesFrom(config);
//    }
//
//    public void resetGamestate() {
//       LinkedList list = new LinkedList(this.challenges);
//       list.addAll(this.additionalSaver);
//       Iterator var2 = list.iterator();
//
//       while(var2.hasNext()) {
//          GamestateSaveable challenge = (GamestateSaveable)var2.next();
//
//          try {
//             challenge.loadGameState(Document.empty());
//             if (challenge instanceof AbstractChallenge) {
//                AbstractChallenge abstractChallenge = (AbstractChallenge)challenge;
//                if (abstractChallenge.getBossbar().isShown()) {
//                   abstractChallenge.getBossbar().update();
//                }
//
//                if (abstractChallenge.getScoreboard().isShown()) {
//                   abstractChallenge.getScoreboard().update();
//                }
//             }
//          } catch (Exception var5) {
//             Logger.error("Could not load gamestate for {}", challenge.getClass().getSimpleName(), var5);
//          }
//       }
//
//    }
//
//    public void saveGameStateInto(@Nonnull Document config) {
//       LinkedList list = new LinkedList(this.challenges);
//       list.addAll(this.additionalSaver);
//       Iterator var3 = list.iterator();
//
//       while(var3.hasNext()) {
//          GamestateSaveable challenge = (GamestateSaveable)var3.next();
//
//          try {
//             Document document = config.getDocument(challenge.getUniqueGamestateName());
//             challenge.writeGameState(document);
//          } catch (Exception var6) {
//             Logger.error("Could not write gamestate of {}", challenge.getClass().getSimpleName(), var6);
//          }
//       }
//
//    }
//
//    public synchronized void saveGamestate(boolean async) {
//       FileDocument config = Challenges.getInstance().getConfigManager().getGamestateConfig();
//       this.saveGameStateInto(config);
//       config.save(async);
//    }
//
//    public void saveSettingsInto(@Nonnull Document config) {
//       Iterator var2 = this.challenges.iterator();
//
//       while(var2.hasNext()) {
//          IChallenge challenge = (IChallenge)var2.next();
//          if (!(challenge instanceof CustomChallenge)) {
//             try {
//                Document document = config.getDocument(challenge.getUniqueGamestateName());
//                challenge.writeSettings(document);
//             } catch (Exception var5) {
//                Logger.error("Could not write settings of {}", challenge.getClass().getSimpleName(), var5);
//             }
//          }
//       }
//
//    }
//
//    public synchronized void saveLocalSettings(boolean async) {
//       FileDocument config = Challenges.getInstance().getConfigManager().getSettingsConfig();
//       this.saveSettingsInto(config);
//       config.save(async);
//    }
//
//    public void saveCustomChallengesInto(@Nonnull Document config) {
//       Collection customChallenges = Challenges.getInstance().getCustomChallengesLoader().getCustomChallenges().values();
//       Iterator var3 = customChallenges.iterator();
//
//       while(var3.hasNext()) {
//          IChallenge challenge = (IChallenge)var3.next();
//
//          try {
//             Document document = config.getDocument(challenge.getUniqueName());
//             challenge.writeSettings(document);
//             challenge.writeGameState(document);
//          } catch (Exception var6) {
//             Logger.error("Could not write settings of {}", challenge.getClass().getSimpleName(), var6);
//          }
//       }
//
//    }
//
//    public synchronized void saveLocalCustomChallenges(boolean async) {
//       FileDocument config = new FileDocumentWrapper(Challenges.getInstance().getDataFile("internal/custom_challenges.json"), new GsonDocument());
//       this.saveCustomChallengesInto(config);
//       config.save(async);
//    }
//
//    @Nullable
//    public IGoal getCurrentGoal() {
//       return this.currentGoal;
//    }
//
//    public void setCurrentGoal(@Nullable IGoal goal) {
//       IGoal oldGoal = this.currentGoal;
//       this.currentGoal = goal;
//       if (oldGoal != null) {
//          oldGoal.setEnabled(false);
//       }
//
//       if (goal != null) {
//          goal.setEnabled(true);
//       }
//
//    }
// }
//
