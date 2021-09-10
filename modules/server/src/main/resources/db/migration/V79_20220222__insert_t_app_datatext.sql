INSERT INTO tech.t_app_data_text (textkey, textvalue, culture)
SELECT 'TracePerformanceWaitingMessage',
       'Your supplychain performance will be available when at least one supplier will submit its data and approved. Please check again later.',
       'en-us' WHERE NOT EXISTS (SELECT 1 FROM tech.t_app_data_text WHERE textkey='TracePerformanceWaitingMessage' and culture='en-us' );