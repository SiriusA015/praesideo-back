package earth.praesideo.database.repositories.suppliers;

import earth.praesideo.database.entities.suppliers.SupplyChain;
import earth.praesideo.models.restapi.traceperformance.AvailableSuppliers;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface SupplyChainRepository extends JpaRepository<SupplyChain, Integer> {

    @Query(nativeQuery = true, value = "select * from trace.t_supply_chain sc " +
            "join static.t_ref_years y on sc.year_representation_id = y.year_representation_id " +
            "where sc.customer_id = :customerId " +
            "  and y.calendar_year = :year " +
            "  and sc.date_removed is null " +
            "order by sc.date_added desc")
    Page<SupplyChain> findAllByCustomerCompanyIdAndYearAndDateRemovedIsNull(@Param("customerId") Integer customerId, @Param("year") Integer year, Pageable pageable);

    @Query(nativeQuery = true, value = "select * from trace.t_supply_chain sc " +
            "join public.t_companies c on c.company_id = sc.supplier_id " +
            "where sc.customer_id = :customerId " +
            "  and sc.date_removed is null " +
            "  and (c.company_name is not null) " +
            "  and (not exists (SELECT 1 FROM public.t_users u WHERE u.company_id = sc.supplier_id)) " +
            "order by sc.date_added desc")
    Page<SupplyChain> findAllByCustomerCompanyIdAndDateInvitationPage(@Param("customerId") Integer customerId, Pageable pageable);

    @Query(nativeQuery = true, value = "select * from trace.t_supply_chain sc " +
            "join static.t_ref_years y on sc.year_representation_id = y.year_representation_id " +
            "join public.t_companies c on c.company_id = sc.supplier_id " +
            "where sc.customer_id = :customerId " +
            "  and y.calendar_year = :year " +
            "  and sc.date_removed is null " +
            "  and (c.company_name is not null) " +
            "  and (not exists (SELECT 1 FROM public.t_users u WHERE u.company_id = sc.supplier_id)) " +
            "order by sc.date_added desc")
    Page<SupplyChain> findAllByCustomerCompanyIdAndYearAndDateInvitationPage(@Param("customerId") Integer customerId, @Param("year") Integer year, Pageable pageable);

    List<SupplyChain> findAllByCustomerCompanyIdAndDateRemovedIsNullAndSupplierInvitationStatusIdNotAndSupplierContactEmailIsNotNull(@Param("supplierId") Integer supplierId, @Param("supplierInvitationStatusId") Integer status);

    @Query(nativeQuery = true, value =
            "select ita.company_id as companyId, cp.company_name as supplierName, sum(ita.probability_1_5_degree) as probability_1_5, " +
                    "sum(ita.probability_2_degree) as probability_2, " +
                    "sum(ita.temperature_alignment_score_overall) as temperatureAlignment, " +
                    "sum(ita.transition_pathway_overall_baseline_value) as TCO2 " +
                    "from impact.t_impact_temperature_alignment ita " +
                    "join public.t_companies cp on ita.company_id = cp.company_id " +
                    "join trace.t_supply_chain sc on cp.company_id = sc.supplier_id " +
                    "where sc.date_removed is null and sc.customer_id = :companyId and ita.is_scenario = false and ita.is_supplychain_aggregated = true " +
                    "group by ita.company_id, cp.company_name")
    Page<AvailableSuppliers> findAvailableSuppliers(@Param("companyId") Integer companyId, Pageable pageable);


    @Query(nativeQuery = true, value =
            "select sum(ita.probability_1_5_degree) as totalProbability_1_5, " +
                    "sum(ita.probability_2_degree) as totalProbability_2, " +
                    "sum(ita.temperature_alignment_score_overall) as totalTemperatureAlignment, " +
                    "sum(ita.transition_pathway_overall_baseline_value) as totalTCO2 " +
                    "from trace.t_supply_chain sc " +
                    "join impact.t_impact_temperature_alignment ita on sc.customer_id = ita.company_id " +
                    "where sc.date_removed is null and sc.customer_id = :companyId and ita.is_scenario = false and ita.is_supplychain_aggregated = true")
    Optional<AvailableSuppliers> getTotalInfoByAvailableSuppliers(@Param("companyId") Integer companyId);

    default void delete(SupplyChain entity) {
        entity.setDateRemoved(new Date());
        save(entity);
    }

    Boolean existsByCustomerCompanyIdAndSupplierCompanyIdAndYearRepresentationIdAndDateRemovedIsNull(Integer customerId, Integer supplierId, Integer yearId);

    @Query(nativeQuery = true, value = "select case when count(sc) > 0 then true else false end from trace.t_supply_chain sc " +
            "join public.t_companies c on c.company_id = sc.supplier_id " +
            "where sc.supplier_id = :supplierId " +
            "  and sc.date_removed is null " +
            "  and (c.company_name is not null and exists (SELECT 1 FROM public.t_users u WHERE u.company_id = sc.supplier_id))")
    Boolean statusSupplier(@Param("supplierId") Integer supplierId);

    Integer countSupplyChainByCustomerCompanyIdAndDateAddedBeforeAndDateRemovedIsNullOrDateRemovedAfter(Integer customerId, Date startDate, Date endDate);

    List<SupplyChain> findByCustomerCompanyIdAndDateRemovedIsNull(Integer companyId);
}
