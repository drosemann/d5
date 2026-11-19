// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/animation/SoundSample.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/animation/SoundSample.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/animation/SoundSample.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.animation;
//
// import java.util.ArrayList;
// import java.util.Iterator;
// import java.util.List;
// import javax.annotation.Nonnull;
// import org.bukkit.Bukkit;
// import org.bukkit.Location;
// import org.bukkit.Sound;
// import org.bukkit.entity.Player;
//
// public final class SoundSample {
//    public static final SoundSample CLICK;
//    public static final SoundSample BASS_OFF;
//    public static final SoundSample BASS_ON;
//    public static final SoundSample PLING;
//    public static final SoundSample KLING;
//    public static final SoundSample LEVEL_UP;
//    public static final SoundSample PLOP;
//    public static final SoundSample LOW_PLOP;
//    public static final SoundSample DEATH;
//    public static final SoundSample TELEPORT;
//    public static final SoundSample OPEN;
//    public static final SoundSample EAT;
//    public static final SoundSample BLAST;
//    public static final SoundSample BREAK;
//    public static final SoundSample WIN;
//    public static final SoundSample DRAGON_BREATH;
//    private final List frames = new ArrayList();
//
//    public static void playStatusSound(@Nonnull Player player, boolean enabled) {
//       (enabled ? BASS_ON : BASS_OFF).play(player);
//    }
//
//    @Nonnull
//    public SoundSample addSound(@Nonnull Sound sound, float volume, float pitch) {
//       this.frames.add(new SoundSample.SoundFrame(sound, volume, pitch));
//       return this;
//    }
//
//    @Nonnull
//    public SoundSample addSound(@Nonnull Sound sound, float volume) {
//       this.frames.add(new SoundSample.SoundFrame(sound, volume));
//       return this;
//    }
//
//    @Nonnull
//    public SoundSample addSound(@Nonnull SoundSample sound) {
//       this.frames.addAll(sound.frames);
//       return this;
//    }
//
//    public void play(@Nonnull Player player) {
//       this.play(player, player.getLocation());
//    }
//
//    public void play(@Nonnull Player player, @Nonnull Location location) {
//       Iterator var3 = this.frames.iterator();
//
//       while(var3.hasNext()) {
//          SoundSample.SoundFrame frame = (SoundSample.SoundFrame)var3.next();
//          frame.play(player, location);
//       }
//
//    }
//
//    public void playIfPlayer(@Nonnull Object target) {
//       if (target instanceof Player) {
//          this.play((Player)target);
//       }
//
//    }
//
//    public void broadcast() {
//       Bukkit.getOnlinePlayers().forEach(this::play);
//    }
//
//    public void broadcast(@Nonnull Location location) {
//       Bukkit.getOnlinePlayers().forEach((player) -> {
//          this.play(player, location);
//       });
//    }
//
//    static {
//       CLICK = (new SoundSample()).addSound(Sound.BLOCK_WOODEN_BUTTON_CLICK_ON, 0.5F);
//       BASS_OFF = (new SoundSample()).addSound(Sound.BLOCK_NOTE_BLOCK_BASS, 0.5F);
//       BASS_ON = (new SoundSample()).addSound(Sound.BLOCK_NOTE_BLOCK_PLING, 0.5F);
//       PLING = (new SoundSample()).addSound(Sound.BLOCK_NOTE_BLOCK_BELL, 1.0F);
//       KLING = (new SoundSample()).addSound(Sound.ENTITY_PLAYER_LEVELUP, 0.6F, 2.0F);
//       LEVEL_UP = (new SoundSample()).addSound(Sound.ENTITY_PLAYER_LEVELUP, 0.6F, 1.1F);
//       PLOP = (new SoundSample()).addSound(Sound.ENTITY_CHICKEN_EGG, 1.0F, 2.0F);
//       LOW_PLOP = (new SoundSample()).addSound(Sound.ENTITY_CHICKEN_EGG, 1.0F, 1.3F);
//       DEATH = (new SoundSample()).addSound(Sound.ENTITY_BAT_DEATH, 0.7F);
//       TELEPORT = (new SoundSample()).addSound(Sound.ITEM_CHORUS_FRUIT_TELEPORT, 0.9F);
//       OPEN = (new SoundSample()).addSound(KLING).addSound(PLOP);
//       EAT = (new SoundSample()).addSound(Sound.ENTITY_PLAYER_BURP, 1.0F);
//       BLAST = (new SoundSample()).addSound(Sound.ENTITY_FIREWORK_ROCKET_LARGE_BLAST, 1.0F);
//       BREAK = (new SoundSample()).addSound(Sound.ENTITY_WITHER_BREAK_BLOCK, 0.7F);
//       WIN = (new SoundSample()).addSound(Sound.UI_TOAST_CHALLENGE_COMPLETE, 1.0F);
//       DRAGON_BREATH = (new SoundSample()).addSound(Sound.ENTITY_ENDER_DRAGON_GROWL, 0.5F);
//    }
//
//    private static final class SoundFrame {
//       private final float pitch;
//       private final float volume;
//       private final Sound sound;
//
//       public SoundFrame(@Nonnull Sound sound, float volume, float pitch) {
//          this.volume = volume;
//          this.pitch = pitch;
//          this.sound = sound;
//       }
//
//       public SoundFrame(@Nonnull Sound sound, float volume) {
//          this(sound, volume, 1.0F);
//       }
//
//       public void play(@Nonnull Player player, @Nonnull Location location) {
//          player.playSound(location, this.sound, this.volume, this.pitch);
//       }
//
//       public float getPitch() {
//          return this.pitch;
//       }
//
//       public float getVolume() {
//          return this.volume;
//       }
//
//       @Nonnull
//       public Sound getSound() {
//          return this.sound;
//       }
//    }
// }
//
