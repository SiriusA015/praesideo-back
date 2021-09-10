package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.CompanyEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CompanyRepository extends JpaRepository<CompanyEntity, Integer> {
    CompanyEntity findByCompanyDomain(String companyDomain);

    Optional<CompanyEntity> findByCompanyId(Integer companyId);

    List<CompanyEntity> findByCompanyName(String companyName);

    List<CompanyEntity> findByCompanyNameIgnoreCase(String companyName);


    List<CompanyEntity> findByStatusId(Integer statusId);

    @Query(value = "select * from public.t_companies c" +
            " where lower(c.company_name) like (lower(:companyName) || '%')" +
            " and (c.company_name is not null)" +
            " and c.company_id not in (select s.supplier_id from trace.t_supply_chain s where s.supplier_id = :companyId and date_removed is null)" +
            " ORDER BY c.company_name ASC", nativeQuery = true)
    List<CompanyEntity> findAvailableSuppliers(@Param("companyName") String companyName, @Param("companyId") Integer companyId);
}
