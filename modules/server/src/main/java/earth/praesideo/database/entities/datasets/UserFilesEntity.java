package earth.praesideo.database.entities.datasets;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_data_files", schema = "impact")
@Data
public class UserFilesEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userFilesId;

    private String filename;
    private String url;
    /**
     * Id taken from UserFileTypeEnum
     */
    private Integer fileType;
    private Date insertedDate;
    private Date updatedDate;

    @Version
    private int version;

    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyEntity company;
}
