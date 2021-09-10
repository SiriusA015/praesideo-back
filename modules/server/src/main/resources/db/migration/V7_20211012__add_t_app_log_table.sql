CREATE TABLE IF NOT EXISTS tech.t_app_log
(
    ID                      BIGINT            NOT NULL PRIMARY KEY,
    LogType                 VARCHAR(100)      NOT NULL,
    LogValue                VARCHAR(10485760) NOT NULL,
    AdditionalInfo_Int_1    INT,
    AdditionalInfo_Int_2    INT,
    AdditionalInfo_Int_3    INT,
    AdditionalInfo_Int_4    INT,
    AdditionalInfo_String_1 VARCHAR(500),
    AdditionalInfo_String_2 VARCHAR(500),
    AdditionalInfo_String_3 VARCHAR(500),
    AdditionalInfo_String_4 VARCHAR(500),
    AdditionalInfo_IQID_1   VARCHAR(50),
    AdditionalInfo_IQID_2   VARCHAR(50),
    AdditionalInfo_IQID_3   VARCHAR(50),
    AdditionalInfo_IQID_4   VARCHAR(50),
    AdditionalInfo_Amount_1 NUMERIC(24, 8),
    AdditionalInfo_Amount_2 NUMERIC(24, 8),
    AdditionalInfo_Amount_3 NUMERIC(24, 8),
    AdditionalInfo_Amount_4 NUMERIC(24, 8)
);

CREATE SEQUENCE IF NOT EXISTS tech.t_app_log_id_seq;
ALTER TABLE tech.t_app_log
    ALTER id SET DEFAULT NEXTVAL('tech.t_app_log_id_seq');
