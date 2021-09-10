update static.t_ref_config_emissions_factor set
    config_etype_id = (select list_id from static.t_ref_list WHERE list_value='Scope1_fire_extinguishers' )
WHERE
        config_etype_id = (select list_id from static.t_ref_list WHERE list_value='Scope1_extinguisher' );

update static.t_ref_config_emissions_unit_factor set
    config_emission_type_id = (select list_id from static.t_ref_list WHERE list_value='Scope1_fire_extinguishers' )
WHERE
        config_emission_type_id = (select list_id from static.t_ref_list WHERE list_value='Scope1_extinguisher' );

update static.t_ref_config_emissions_type set
    etype_id = (select list_id from static.t_ref_list WHERE list_value='Scope1_fire_extinguishers' )
                                            ,etypeattr_id1 = (select list_id from static.t_ref_list WHERE list_value='Scope1_fire_extinguishers' )
WHERE
        etype_id = (select list_id from static.t_ref_list WHERE list_value='Scope1_extinguisher' );
