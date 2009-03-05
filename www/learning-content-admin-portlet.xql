<!--  -->
<!-- @creation-date 2008-01-22 -->
<!-- @cvs-id $Id$ -->

<queryset>

  <fullquery name="get_communities">
    <querytext>
        select instance_name, package_id from apm_packages where package_id in (
                        select distinct ppm.object_id
                         from acs_object_party_privilege_map ppm, parties pr, site_nodes s
                         where ppm.object_id in (
                                        select object_id from site_nodes
                                        where parent_id in (
                                                        select node_id from site_nodes where name in ('clubs')))
                        and   pr.party_id = ppm.party_id
                        and   pr.party_id = :user_id
                        and   ppm.privilege = 'admin')
    </querytext>
  </fullquery>


  <fullquery name="get_departments">
    <querytext>
	select instance_name, package_id from apm_packages where package_id in (
			select distinct ppm.object_id
        		 from acs_object_party_privilege_map ppm, parties pr, site_nodes s
        		 where ppm.object_id in ( 
					select object_id from site_nodes
                                  	where parent_id in ( 
							select node_id from site_nodes where name in ('classes')))
         		and   pr.party_id = ppm.party_id
         		and   pr.party_id = :user_id
         		and   ppm.privilege = 'admin')
    </querytext>
  </fullquery>

  <fullquery name="get_classes">
    <querytext>

	select instance_name, package_id from apm_packages where package_id in (
                        select distinct ppm.object_id
                         from acs_object_party_privilege_map ppm, parties pr, site_nodes s
                         where ppm.object_id in (
                                        select object_id from site_nodes
                                        where parent_id in (
                                                        select node_id from site_nodes where object_id = :dep_id ))
                        and   pr.party_id = ppm.party_id
                        and   pr.party_id = :user_id
                        and   ppm.privilege = 'admin')

    </querytext>
  </fullquery>

  <fullquery name="get_courses">
    <querytext>

	select instance_name, package_id from apm_packages where package_id in (
                        select distinct ppm.object_id
                         from acs_object_party_privilege_map ppm, parties pr, site_nodes s
                        where ppm.object_id in (
                                        select object_id from site_nodes
                                        where parent_id in (
                                                        select node_id from site_nodes where object_id = :cl_id ))
                        and   pr.party_id = ppm.party_id
                        and   pr.party_id = :user_id
                        and   ppm.privilege = 'admin')

    </querytext>
  </fullquery>

  <fullquery name="select_content">
    <querytext>

	select m.element_id, m.pretty_name, pep.value as name 
		  from portal_element_map m, portal_pages p, portal_element_parameters pep
        	  where m.page_id = p.page_id 
        	  and p.portal_id = $template_portal_id 
        	  and m.datasource_id = [portal::get_datasource_id [learning_content_portlet::get_my_name]]
        	  and pep.element_id = m.element_id and pep.key = 'page_name'

    </querytext>
  </fullquery>


</queryset>
