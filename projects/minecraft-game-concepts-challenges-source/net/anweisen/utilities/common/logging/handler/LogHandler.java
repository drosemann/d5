package net.anweisen.utilities.common.logging.handler;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.annotation.Nonnull;

public interface LogHandler {
   DateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss.SSS");

   void handle(@Nonnull LogEntry var1) throws Exception;
}
