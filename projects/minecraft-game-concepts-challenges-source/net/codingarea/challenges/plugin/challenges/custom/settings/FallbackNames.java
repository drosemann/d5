package net.codingarea.challenges.plugin.challenges.custom.settings;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.annotation.Nonnull;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface FallbackNames {
   @Nonnull
   String[] value();
}
