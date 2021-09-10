package earth.praesideo.utils;

import java.math.BigDecimal;
import java.text.NumberFormat;

public class BigDecimalUtils {
    public static String getFormattedAmount(BigDecimal input) {
        if (input!=null) {
            input = input.setScale(2);
            return NumberFormat.getCurrencyInstance(java.util.Locale.US).format(input).toString().replace("$", "");
        }
        return "";
    }
}