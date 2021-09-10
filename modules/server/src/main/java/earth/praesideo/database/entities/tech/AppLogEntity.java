package earth.praesideo.database.entities.tech;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_app_log", schema = "tech")
@Data
public class AppLogEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "logtype")
    @Enumerated(EnumType.STRING)
    private AppLogType logType;

    @Column(name = "logvalue")
    private String logValue;

    @Column(name = "additionalinfo_int_1")
    private Integer additionalInfoInt1;

    @Column(name = "additionalinfo_int_2")
    private Integer additionalInfoInt2;

    @Column(name = "additionalinfo_int_3")
    private Integer additionalInfoInt3;

    @Column(name = "additionalinfo_int_4")
    private Integer additionalInfoInt4;

    @Column(name = "additionalinfo_string_1")
    private String additionalInfoString1;

    @Column(name = "additionalinfo_string_2")
    private String additionalInfoString2;

    @Column(name = "additionalinfo_string_3")
    private String additionalInfoString3;

    @Column(name = "additionalinfo_string_4")
    private String additionalInfoString4;

    @Column(name = "additionalinfo_iqid_1")
    private String additionalInfoIqId1;

    @Column(name = "additionalinfo_iqid_2")
    private String additionalInfoIqId2;

    @Column(name = "additionalinfo_iqid_3")
    private String additionalInfoIqId3;

    @Column(name = "additionalinfo_iqid_4")
    private String additionalInfoIqId4;

    @Column(name = "additionalinfo_amount_1")
    private Integer additionalInfoAmount1;

    @Column(name = "additionalinfo_amount_2")
    private Integer additionalInfoAmount2;

    @Column(name = "additionalinfo_amount_3")
    private Integer additionalInfoAmount3;

    @Column(name = "additionalinfo_Amount_4")
    private Integer additionalInfoAmount4;

    @Column(name = "additionalinfo_datetime1")
    private Date additionalinfoDatetime1;

    @Column(name = "additionalinfo_datetime2")
    private Date additionalinfoDatetime2;

    @Column(name = "additionalinfo_datetime3")
    private Date additionalinfoDatetime3;

    @Column(name = "additionalinfo_datetime4")
    private Date additionalinfoDatetime4;

}
