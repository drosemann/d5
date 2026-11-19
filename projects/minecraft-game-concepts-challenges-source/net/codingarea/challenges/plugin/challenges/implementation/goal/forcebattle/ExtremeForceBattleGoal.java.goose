// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/forcebattle/ExtremeForceBattleGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/forcebattle/ExtremeForceBattleGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/forcebattle/ExtremeForceBattleGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle;
//
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Objects;
// import java.util.UUID;
// import java.util.Map.Entry;
// import java.util.function.Function;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.AdvancementTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.BiomeTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.BlockTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.DamageTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.ForceTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.HeightTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.ItemTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.MobTarget;
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.PositionTarget;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleDisplayGoal;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.NamespacedKey;
// import org.bukkit.World;
// import org.bukkit.World.Environment;
// import org.bukkit.advancement.Advancement;
// import org.bukkit.advancement.AdvancementProgress;
// import org.bukkit.block.Biome;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDamageEvent;
// import org.bukkit.event.entity.EntityDeathEvent;
// import org.jetbrains.annotations.NotNull;
//
// public class ExtremeForceBattleGoal extends ForceBattleDisplayGoal {
//    public ExtremeForceBattleGoal() {
//       super(Message.forName("menu-extreme-force-battle-goal-settings"));
//       this.registerSetting("give-item", new MenuSetting.BooleanSubSetting(() -> {
//          return new ItemBuilder(Material.CHEST, Message.forName("item-force-item-battle-goal-give-item"));
//       }, false));
//       this.registerSetting("give-block", new MenuSetting.BooleanSubSetting(() -> {
//          return new ItemBuilder(Material.CHEST, Message.forName("item-force-block-battle-goal-give-block"));
//       }, false));
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.BOOK, Message.forName("item-extreme-force-battle-goal"));
//    }
//
//    protected ForceTarget[] getTargetsPossibleToFind() {
//       return new ForceTarget[0];
//    }
//
//    @ScheduledTask(
//       ticks = 5,
//       async = false,
//       timerPolicy = TimerPolicy.STARTED
//    )
//    public void checkTargets() {
//       Iterator var1 = this.currentTarget.entrySet().iterator();
//
//       while(var1.hasNext()) {
//          Entry entry = (Entry)var1.next();
//          UUID uuid = (UUID)entry.getKey();
//          ForceTarget target = (ForceTarget)entry.getValue();
//          Player player = Bukkit.getPlayer(uuid);
//          if (player != null && !ignorePlayer(player) && target.check(player)) {
//             this.handleTargetFound(player);
//          }
//       }
//
//    }
//
//    public ForceTarget getTargetFromDocument(Document document, String path) {
//       Document targetDocument = document.getDocument(path);
//       String targetTypeString = targetDocument.getString("type");
//       String value = targetDocument.getString("value");
//       ExtremeForceBattleGoal.TargetType targetType = ExtremeForceBattleGoal.TargetType.valueOf(targetTypeString);
//       return (ForceTarget)targetType.parse().apply(value);
//    }
//
//    public List getListFromDocument(Document document, String path) {
//       List targetDocuments = document.getDocumentList(path);
//       List targets = new ArrayList();
//       Iterator var5 = targetDocuments.iterator();
//
//       while(var5.hasNext()) {
//          Document targetDocument = (Document)var5.next();
//          String targetTypeString = targetDocument.getString("type");
//          Object value = targetDocument.getObject("value");
//          ExtremeForceBattleGoal.TargetType targetType = ExtremeForceBattleGoal.TargetType.valueOf(targetTypeString);
//          targets.add((ForceTarget)targetType.parse().apply(value));
//       }
//
//       return targets;
//    }
//
//    public void setTargetInDocument(Document document, String path, ForceTarget target) {
//       document.set(path, Document.create().set("type", target.getType().name()).set("value", target.getTargetSaveObject()));
//    }
//
//    public void setFoundListInDocument(Document document, String path, List targets) {
//       List documents = new ArrayList();
//       Iterator var5 = targets.iterator();
//
//       while(var5.hasNext()) {
//          ForceTarget forceTarget = (ForceTarget)var5.next();
//          documents.add(Document.create().set("type", forceTarget.getType().name()).set("value", forceTarget.getTargetSaveObject()));
//       }
//
//       document.set(path, documents);
//    }
//
//    protected Message getLeaderboardTitleMessage() {
//       return Message.forName("extreme-force-battle-leaderboard");
//    }
//
//    public void setRandomTarget(Player player) {
//       this.updateDisplayStand(player);
//       ExtremeForceBattleGoal.TargetType targetType = (ExtremeForceBattleGoal.TargetType)globalRandom.choose((Object[])ExtremeForceBattleGoal.TargetType.values());
//       ForceTarget newTarget = (ForceTarget)targetType.getRandomTarget().apply(player);
//       if (newTarget instanceof AdvancementTarget) {
//          AdvancementProgress progress = player.getAdvancementProgress((Advancement)((AdvancementTarget)newTarget).getTarget());
//          Collection var10000 = progress.getAwardedCriteria();
//          Objects.requireNonNull(progress);
//          var10000.forEach(progress::revokeCriteria);
//       }
//
//       this.currentTarget.put(player.getUniqueId(), newTarget);
//       this.getNewTargetMessage(newTarget).send(player, Prefix.CHALLENGES, this.getTargetMessageReplacement(newTarget));
//       SoundSample.PLING.play(player);
//       if (this.scoreboard.isShown()) {
//          this.scoreboard.update();
//       }
//
//    }
//
//    protected void setScoreboardContent() {
//       this.scoreboard.setContent((board, player) -> {
//          List ingamePlayers = ChallengeAPI.getIngamePlayers();
//          int emptyLinesAvailable = 15 - ingamePlayers.size();
//          if (emptyLinesAvailable > 0) {
//             board.addLine("");
//             --emptyLinesAvailable;
//          }
//
//          for(int i = 0; i < ingamePlayers.size() && i < 15; ++i) {
//             Player ingamePlayer = (Player)ingamePlayers.get(i);
//             ForceTarget target = (ForceTarget)this.currentTarget.get(ingamePlayer.getUniqueId());
//             String display = target == null ? Message.forName("none").asString() : target.getScoreboardDisplayMessage().asString(this.getTargetName(target));
//             board.addLine(NameHelper.getName(ingamePlayer) + " §8» §e" + display);
//          }
//
//          if (emptyLinesAvailable > 0) {
//             board.addLine("");
//          }
//
//       });
//    }
//
//    protected boolean shouldRegisterDupedTargetsSetting() {
//       return false;
//    }
//
//    public void handleJokerUse(Player player) {
//       ForceTarget target = (ForceTarget)this.currentTarget.get(player.getUniqueId());
//       if (this.giveItemOnSkip() && target instanceof ItemTarget) {
//          ItemTarget itemTarget = (ItemTarget)target;
//          InventoryUtils.dropOrGiveItem(player.getInventory(), player.getLocation(), (Material)((Material)itemTarget.getTarget()));
//       } else if (this.giveBlockOnSkip() && target instanceof BlockTarget) {
//          BlockTarget blockTarget = (BlockTarget)target;
//          InventoryUtils.dropOrGiveItem(player.getInventory(), player.getLocation(), (Material)((Material)blockTarget.getTarget()));
//       }
//
//       super.handleJokerUse(player);
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onKill(@Nonnull EntityDeathEvent event) {
//       if (this.shouldExecuteEffect()) {
//          LivingEntity entity = event.getEntity();
//          Player killer = entity.getKiller();
//          if (killer != null) {
//             if (!ignorePlayer(killer)) {
//                if (this.currentTarget.get(killer.getUniqueId()) != null) {
//                   if (this.currentTarget.get(killer.getUniqueId()) instanceof MobTarget) {
//                      MobTarget target = (MobTarget)this.currentTarget.get(killer.getUniqueId());
//                      if (target.getTarget() != entity.getType()) {
//                         return;
//                      }
//
//                      this.handleTargetFound(killer);
//                   }
//
//                }
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onDamage(@Nonnull EntityDamageEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getEntity() instanceof Player) {
//             Player player = (Player)event.getEntity();
//             if (!ignorePlayer(player)) {
//                if (this.currentTarget.get(player.getUniqueId()) != null) {
//                   if (this.currentTarget.get(player.getUniqueId()) instanceof DamageTarget) {
//                      DamageTarget target = (DamageTarget)this.currentTarget.get(player.getUniqueId());
//                      int damage = (int)ChallengeHelper.getFinalDamage(event);
//                      if (damage != (Integer)target.getTarget()) {
//                         return;
//                      }
//
//                      this.handleTargetFound(player);
//                   }
//
//                }
//             }
//          }
//       }
//    }
//
//    private boolean giveItemOnSkip() {
//       return this.getSetting("give-item").getAsBoolean();
//    }
//
//    private boolean giveBlockOnSkip() {
//       return this.getSetting("give-block").getAsBoolean();
//    }
//
//    public static enum TargetType {
//       ITEM((object) -> {
//          return new ItemTarget(Material.valueOf((String)object));
//       }, (player) -> {
//          return new ItemTarget((Material)ExtremeForceBattleGoal.globalRandom.choose(ItemTarget.getPossibleItems()));
//       }),
//       BLOCK((object) -> {
//          return new BlockTarget(Material.valueOf((String)object));
//       }, (player) -> {
//          return new BlockTarget((Material)ExtremeForceBattleGoal.globalRandom.choose(BlockTarget.getPossibleBlocks()));
//       }),
//       HEIGHT((object) -> {
//          return new HeightTarget(Integer.valueOf((String)object));
//       }, (player) -> {
//          World world = ChallengeAPI.getGameWorld(Environment.NORMAL);
//          int height = ExtremeForceBattleGoal.globalRandom.range(BukkitReflectionUtils.getMinHeight(world), world.getMaxHeight());
//          return new HeightTarget(height);
//       }),
//       MOB((object) -> {
//          return new MobTarget(EntityType.valueOf((String)object));
//       }, (player) -> {
//          return new MobTarget((EntityType)ExtremeForceBattleGoal.globalRandom.choose(MobTarget.getPossibleMobs()));
//       }),
//       BIOME((object) -> {
//          return new BiomeTarget(Biome.valueOf((String)object));
//       }, (player) -> {
//          return new BiomeTarget((Biome)ExtremeForceBattleGoal.globalRandom.choose(BiomeTarget.getPossibleBiomes()));
//       }),
//       DAMAGE((object) -> {
//          return new DamageTarget(Integer.valueOf((String)object));
//       }, (player) -> {
//          return new DamageTarget(ExtremeForceBattleGoal.globalRandom.range(1, 19));
//       }),
//       ADVANCEMENT((object) -> {
//          return new AdvancementTarget(Bukkit.getAdvancement(NamespacedKey.fromString((String)object)));
//       }, (player) -> {
//          return new AdvancementTarget((Advancement)ExtremeForceBattleGoal.globalRandom.choose(AdvancementTarget.getPossibleAdvancements()));
//       }),
//       POSITION((object) -> {
//          Document document = (Document)object;
//          return new PositionTarget(document.getDouble("x"), document.getDouble("z"));
//       }, PositionTarget::new);
//
//       private final Function parseFunction;
//       private final Function randomTargetFunction;
//
//       private TargetType(Function parseFunction, Function randomTargetFunction) {
//          this.parseFunction = parseFunction;
//          this.randomTargetFunction = randomTargetFunction;
//       }
//
//       public Function parse() {
//          return this.parseFunction;
//       }
//
//       public Function getRandomTarget() {
//          return this.randomTargetFunction;
//       }
//
//       // $FF: synthetic method
//       private static ExtremeForceBattleGoal.TargetType[] $values() {
//          return new ExtremeForceBattleGoal.TargetType[]{ITEM, BLOCK, HEIGHT, MOB, BIOME, DAMAGE, ADVANCEMENT, POSITION};
//       }
//    }
// }
//
