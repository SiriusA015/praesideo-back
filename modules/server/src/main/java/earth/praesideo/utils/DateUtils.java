package earth.praesideo.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
    private static final String EXPORT_FILE_DATE_FORMAT = "yyyyMMddHHmmss";
    private static final String EMISSION_FACTOR_DATE_FORMAT = "yyyy-MM-dd";
    private static final String BILLING_DATE_FORMAT = "dd-MMM-yyyy";

    public static String getExportFileDateFormatted(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(EXPORT_FILE_DATE_FORMAT);
        return simpleDateFormat.format(date);
    }
    public static String getEmissionFactorDateFormatted(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(EMISSION_FACTOR_DATE_FORMAT);
        return simpleDateFormat.format(date);
    }
    public static String getBillingDateFormatted(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(BILLING_DATE_FORMAT);
        return simpleDateFormat.format(date);
    }

    public static Date addDayToDate(Date date, Integer days) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, days);
        return c.getTime();
    }
    public static Date addMonthToDate(Date date, Integer months) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.MONTH, months);
        return c.getTime();
    }
    public static Date addYearToDate(Date date, Integer years) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.YEAR, years);
        return c.getTime();
    }
}
