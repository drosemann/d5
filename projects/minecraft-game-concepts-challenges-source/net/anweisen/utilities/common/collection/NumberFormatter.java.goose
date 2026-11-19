// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/NumberFormatter.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/NumberFormatter.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/NumberFormatter.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.text.DecimalFormat;
// import java.text.DecimalFormatSymbols;
// import java.util.function.Consumer;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
//
// public interface NumberFormatter {
//    NumberFormatter DEFAULT = fromPattern("0.##", (String)null, false);
//    NumberFormatter INTEGER = (value) -> {
//       return (int)value + "";
//    };
//    NumberFormatter SPACE_SPLIT = fromPattern("###,##0.###############", (String)null, false, (init) -> {
//       updateSymbols(init, (symbols) -> {
//          symbols.setGroupingSeparator(' ');
//       });
//    });
//    NumberFormatter FLOATING_POINT = fromPattern("0.0", (String)null, false);
//    NumberFormatter DOUBLE_FLOATING_POINT = fromPattern("0.00", (String)null, false);
//    NumberFormatter BIG_FLOATING_POINT = fromPattern("###,##0.00000", (String)null, false);
//    NumberFormatter PERCENTAGE = fromPattern("0.##", "%", true);
//    NumberFormatter FLOATING_PERCENTAGE = fromPattern("0.00", "%", true);
//    NumberFormatter MIDDLE_NUMBER = fromPattern("###,###,##0.#", (String)null, false);
//    NumberFormatter TIME = (value) -> {
//       int seconds = (int)value;
//       int minutes = seconds / 60;
//       int hours = minutes / 60;
//       int days = hours / 24;
//       int years = days / 365;
//       seconds %= 60;
//       minutes %= 60;
//       hours %= 24;
//       days %= 365;
//       return ((years > 0 ? years + "y " : "") + (days > 0 ? days + "d " : "") + (hours > 0 ? hours + "h " : "") + (minutes > 0 ? minutes + "m " : "") + (seconds <= 0 && (years != 0 || days != 0 || hours != 0 || minutes != 0) ? "" : seconds + "s")).trim();
//    };
//    NumberFormatter BIG_TIME = (value) -> {
//       int seconds = (int)value;
//       int minutes = seconds / 60;
//       int hours = minutes / 60;
//       int days = hours / 24;
//       int years = days / 365;
//       minutes %= 60;
//       hours %= 24;
//       days %= 365;
//       return ((years > 0 ? years + "y " : "") + (days > 0 ? days + "d " : "") + (hours > 0 ? hours + "h " : "") + (minutes <= 0 && (years != 0 || days != 0 || hours != 0) ? "" : minutes + "m ")).trim();
//    };
//    NumberFormatter GERMAN_TIME = (value) -> {
//       DecimalFormat format = new DecimalFormat("00");
//       long millis = (long)value;
//       long seconds = millis / 1000L;
//       long minutes = seconds / 60L;
//       long hours = minutes / 60L;
//       long days = hours / 24L;
//       seconds %= 60L;
//       minutes %= 60L;
//       hours %= 24L;
//       return (days > 0L ? (days == 1L ? "1 Tag " : days + " Tage ") : "") + (hours > 0L ? format.format(hours) + ":" : "") + format.format(minutes) + ":" + format.format(seconds);
//    };
//    NumberFormatter FULL_GERMAN_TIME_HOURS = (value) -> {
//       long seconds = (long)value;
//       long minutes = seconds / 60L;
//       long hours = minutes / 60L;
//       seconds %= 60L;
//       minutes %= 60L;
//       return hours > 0L ? (hours == 1L ? "1 Stunde" : hours + " Stunden") : (minutes == 1L ? "1 Minute" : minutes + " Minuten");
//    };
//    NumberFormatter FULL_GERMAN_TIME = (value) -> {
//       long seconds = (long)value;
//       long minutes = seconds / 60L;
//       long hours = minutes / 60L;
//       long days = hours / 24L;
//       long years = days / 365L;
//       seconds %= 60L;
//       minutes %= 60L;
//       hours %= 24L;
//       days %= 265L;
//       return ((years > 0L ? (years == 1L ? "1 Jahr " : years + " Jahre ") : "") + (days > 0L ? (days == 1L ? "1 Tag " : days + " Tage ") : "") + (hours > 0L ? (hours == 1L ? "1 Stunde " : hours + " Stunden ") : "") + (minutes > 0L ? (minutes == 1L ? "1 Minute " : minutes + " Minuten ") : "") + (seconds <= 0L && (years != 0L || hours != 0L || minutes != 0L) ? "" : (seconds == 1L ? "1 Sekunde" : seconds + " Sekunden"))).trim();
//    };
//    NumberFormatter NORMAL_FULL_GERMAN_TIME = (value) -> {
//       long seconds = (long)value;
//       long minutes = seconds / 60L;
//       long hours = minutes / 60L;
//       long days = hours / 24L;
//       long years = days / 365L;
//       minutes %= 60L;
//       hours %= 24L;
//       days %= 265L;
//       return ((years > 0L ? (years == 1L ? "1 Jahr " : years + " Jahre ") : "") + (days > 0L ? (days == 1L ? "1 Tag " : days + " Tage ") : "") + (hours > 0L ? (hours == 1L ? "1 Stunde " : hours + " Stunden ") : "") + (minutes <= 0L && value != 0.0D ? "" : (minutes == 1L ? "1 Minute " : minutes + " Minuten "))).trim();
//    };
//    NumberFormatter BIG_FULL_GERMAN_TIME = (value) -> {
//       long seconds = (long)value;
//       long minutes = seconds / 60L;
//       long hours = minutes / 60L;
//       long days = hours / 24L;
//       long years = days / 365L;
//       hours %= 24L;
//       days %= 265L;
//       return ((years > 0L ? (years == 1L ? "1 Jahr " : years + " Jahre ") : "") + (days > 0L ? (days == 1L ? "1 Tag " : days + " Tage ") : "") + (hours > 0L || years == 0L && days == 0L ? (hours == 1L ? "1 Stunde" : hours + " Stunden") : "")).trim();
//    };
//    NumberFormatter BIG_NUMBER = (value) -> {
//       DecimalFormat format = new DecimalFormat("0.##");
//       String ending = "";
//       double divide;
//       if (value < 1000.0D) {
//          divide = 1.0D;
//          format = new DecimalFormat("0.#");
//       } else if (value < 1000000.0D) {
//          divide = 1000.0D;
//          ending = "k";
//       } else if (value < 1.0E9D) {
//          divide = 1000000.0D;
//          ending = "m";
//       } else if (value < 1.0E12D) {
//          divide = 1.0E9D;
//          ending = "b";
//       } else {
//          divide = 1.0E12D;
//          ending = "t";
//       }
//
//       value /= divide;
//       return format.format(value) + ending;
//    };
//    NumberFormatter DATA_SIZE = (value) -> {
//       if (value < 0.0D) {
//          value = 0.0D;
//       }
//
//       DecimalFormat format = new DecimalFormat("0.##");
//       double divide;
//       String ending;
//       if (value < 1000000.0D) {
//          divide = 1000.0D;
//          format = new DecimalFormat("0.#");
//          ending = "KB";
//       } else if (value < 1.0E9D) {
//          divide = 1000000.0D;
//          ending = "MB";
//       } else if (value < 1.0E12D) {
//          divide = 1.0E9D;
//          ending = "GB";
//       } else {
//          divide = 1.0E12D;
//          ending = "TB";
//       }
//
//       value /= divide;
//       return format.format(value) + ending;
//    };
//    NumberFormatter BIG_DATA_SIZE = (value) -> {
//       if (value < 0.0D) {
//          value = 0.0D;
//       }
//
//       DecimalFormat format = new DecimalFormat("0.##");
//       double divide;
//       String ending;
//       if (value < 1.0E12D) {
//          divide = 1.0E9D;
//          ending = "GB";
//       } else if (value < 1.0E15D) {
//          divide = 1.0E12D;
//          ending = "TB";
//       } else {
//          divide = 1.0E15D;
//          ending = "PB";
//       }
//
//       value /= divide;
//       return format.format(value) + ending;
//    };
//    NumberFormatter ORDINAL = (value) -> {
//       String string = String.valueOf((long)value);
//       int number = Integer.parseInt(string.substring(string.length() - 1));
//       String ending = "th";
//       if (value != 11.0D && value != 12.0D && value != 13.0D) {
//          switch(number) {
//          case 1:
//             ending = "st";
//             break;
//          case 2:
//             ending = "nd";
//             break;
//          case 3:
//             ending = "rd";
//          }
//       }
//
//       return string + ending;
//    };
//    NumberFormatter GERMAN_ORDINAL = fromPattern("0", ".", false);
//
//    @Nonnull
//    @CheckReturnValue
//    String format(double var1);
//
//    @Nonnull
//    @CheckReturnValue
//    default String format(float value) {
//       return this.format(value);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default String format(long value) {
//       return this.format(value);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default String format(int value) {
//       return this.format(value);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default String format(short value) {
//       return this.format(value);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default String format(byte value) {
//       return this.format(value);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default String format(@Nonnull Number number) {
//       return this.format(number.doubleValue());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static NumberFormatter fromPattern(@Nonnull String pattern, String ending, boolean positive) {
//       return fromPattern(pattern, ending, positive, (Consumer)null);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static NumberFormatter fromPattern(@Nonnull String pattern, String ending, boolean positive, Consumer init) {
//       DecimalFormat format = new DecimalFormat(pattern);
//       if (init != null) {
//          init.accept(format);
//       }
//
//       return (value) -> {
//          return Double.isNaN(value) ? "NaN" : format.format(positive ? (value > 0.0D ? value : 0.0D) : value) + (ending != null ? ending : "");
//       };
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static DecimalFormatSymbols updateSymbols(@Nonnull DecimalFormatSymbols symbols, @Nonnull Consumer action) {
//       action.accept(symbols);
//       return symbols;
//    }
//
//    @CheckReturnValue
//    static void updateSymbols(@Nonnull DecimalFormat format, @Nonnull Consumer action) {
//       format.setDecimalFormatSymbols(updateSymbols(format.getDecimalFormatSymbols(), action));
//    }
// }
//
