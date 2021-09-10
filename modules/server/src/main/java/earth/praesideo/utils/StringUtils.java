package earth.praesideo.utils;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.UUID;

public class StringUtils {
    public static String getUUID() {
        return UUID.randomUUID().toString();
    }

    public static String getUUIDNoDashes() { return UUID.randomUUID().toString().replace("-",""); }

    public static String exceptionToString(Exception ex) {
        StringWriter sw = new StringWriter();
        ex.printStackTrace(new PrintWriter(sw));
        return sw.toString();
    }

}
