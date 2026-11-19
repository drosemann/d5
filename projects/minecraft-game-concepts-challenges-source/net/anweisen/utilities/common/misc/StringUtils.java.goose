// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/misc/StringUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/misc/StringUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/misc/StringUtils.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.misc;
//
// import java.util.Iterator;
// import java.util.Optional;
// import java.util.concurrent.Callable;
// import java.util.function.Function;
// import java.util.function.Supplier;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.collection.WrappedException;
// import net.anweisen.utilities.common.logging.ILogger;
//
// public final class StringUtils {
//    private static final ILogger logger = ILogger.forThisClass();
//
//    private StringUtils() {
//    }
//
//    @Nonnull
//    public static String getEnumName(@Nonnull Enum enun) {
//       return getEnumName(enun.name());
//    }
//
//    @Nonnull
//    public static String getEnumName(@Nonnull String name) {
//       StringBuilder builder = new StringBuilder();
//       boolean nextUpperCase = true;
//       char[] var3 = name.toCharArray();
//       int var4 = var3.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          char letter = var3[var5];
//          if (letter == '_') {
//             builder.append(' ');
//             nextUpperCase = true;
//          } else {
//             builder.append(nextUpperCase ? Character.toUpperCase(letter) : Character.toLowerCase(letter));
//             nextUpperCase = false;
//          }
//       }
//
//       return builder.toString();
//    }
//
//    @Nonnull
//    public static String format(@Nonnull String sequence, @Nonnull Object... args) {
//       char start = '{';
//       char end = '}';
//       boolean inArgument = false;
//       StringBuilder argument = new StringBuilder();
//       StringBuilder builder = new StringBuilder();
//       char[] var7 = sequence.toCharArray();
//       int var8 = var7.length;
//
//       for(int var9 = 0; var9 < var8; ++var9) {
//          char c = var7[var9];
//          if (c == end && inArgument) {
//             inArgument = false;
//
//             try {
//                int arg = Integer.parseInt(argument.toString());
//                Object current = args[arg];
//                Object replacement = current instanceof Supplier ? ((Supplier)current).get() : (current instanceof Callable ? ((Callable)current).call() : current);
//                builder.append(replacement);
//             } catch (IndexOutOfBoundsException | NumberFormatException var14) {
//                logger.warn("Invalid argument index '{}'", argument);
//                builder.append(start).append(argument).append(end);
//             } catch (Exception var15) {
//                throw new WrappedException(var15);
//             }
//
//             argument = new StringBuilder();
//          } else if (c == start && !inArgument) {
//             inArgument = true;
//          } else if (inArgument) {
//             argument.append(c);
//          } else {
//             builder.append(c);
//          }
//       }
//
//       if (argument.length() > 0) {
//          builder.append(start).append(argument);
//       }
//
//       return builder.toString();
//    }
//
//    @Nonnull
//    public static String getAfterLastIndex(@Nonnull String input, @Nonnull String separator) {
//       return (String)Optional.of(input).filter((name) -> {
//          return name.contains(separator);
//       }).map((name) -> {
//          return name.substring(name.lastIndexOf(separator) + separator.length());
//       }).orElse("");
//    }
//
//    @Nonnull
//    public static String[] format(@Nonnull String[] array, @Nonnull Object... args) {
//       String[] result = new String[array.length];
//
//       for(int i = 0; i < array.length; ++i) {
//          result[i] = format(array[i], args);
//       }
//
//       return result;
//    }
//
//    @Nonnull
//    public static String getArrayAsString(@Nonnull String[] array, @Nonnull String separator) {
//       StringBuilder builder = new StringBuilder();
//       String[] var3 = array;
//       int var4 = array.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          String string = var3[var5];
//          if (builder.length() != 0) {
//             builder.append(separator);
//          }
//
//          builder.append(string);
//       }
//
//       return builder.toString();
//    }
//
//    @Nonnull
//    public static String[] getStringAsArray(@Nonnull String string) {
//       return string.split("\n");
//    }
//
//    @Nonnull
//    public static String getIterableAsString(@Nonnull Iterable iterable, @Nonnull String separator, @Nonnull Function mapper) {
//       StringBuilder builder = new StringBuilder();
//       Iterator var4 = iterable.iterator();
//
//       while(var4.hasNext()) {
//          Object t = var4.next();
//          if (builder.length() > 0) {
//             builder.append(separator);
//          }
//
//          String string = (String)mapper.apply(t);
//          builder.append(string);
//       }
//
//       return builder.toString();
//    }
//
//    @Nonnull
//    public static String repeat(@Nullable Object sequence, int amount) {
//       StringBuilder builder = new StringBuilder();
//
//       for(int i = 0; i < amount; ++i) {
//          builder.append(sequence);
//       }
//
//       return builder.toString();
//    }
//
//    private static int getMultiplier(char c) {
//       switch(Character.toLowerCase(c)) {
//       case 'd':
//          return 86400;
//       case 'h':
//          return 3600;
//       case 'm':
//          return 60;
//       case 'w':
//          return 604800;
//       case 'y':
//          return 31536000;
//       default:
//          return 1;
//       }
//    }
//
//    public static long parseSeconds(@Nonnull String input) {
//       if (input.toLowerCase().startsWith("perm")) {
//          return -1L;
//       } else {
//          long current = 0L;
//          long seconds = 0L;
//          char[] var5 = input.toCharArray();
//          int var6 = var5.length;
//
//          for(int var7 = 0; var7 < var6; ++var7) {
//             char c = var5[var7];
//
//             try {
//                long i = Long.parseUnsignedLong(String.valueOf(c));
//                current *= 10L;
//                current += i;
//             } catch (Exception var11) {
//                int multiplier = getMultiplier(c);
//                seconds += current * (long)multiplier;
//                current = 0L;
//             }
//          }
//
//          seconds += current;
//          return seconds;
//       }
//    }
//
//    public static boolean isNumber(@Nonnull String sequence) {
//       try {
//          Double.parseDouble(sequence);
//          return true;
//       } catch (Exception var2) {
//          return false;
//       }
//    }
//
//    private static int indexOf(@Nonnull String string, @Nonnull String pattern, int occurrenceIndex) {
//       int lastIndex = 0;
//
//       for(int currentLayer = 0; currentLayer <= occurrenceIndex; ++currentLayer) {
//          int index = string.indexOf(pattern, lastIndex > 0 ? lastIndex + 1 : 0);
//          if (index == -1) {
//             return -1;
//          }
//
//          lastIndex = index + 1;
//       }
//
//       return lastIndex;
//    }
// }
//
