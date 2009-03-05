ad_page_contract {
    The display logic for the content admin portlet
    @author Byron Linares bhlr@galileo.edu
} {
    package_id:optional
    template_portal_id:optional
    referer:optional
    return_url:optional
}

if {![exists_and_not_null package_id]} {
    set package_id [dotlrn_community::get_community_id]
}

if { $package_id ne "" } {

    if {![exists_and_not_null template_portal_id]} {
        set template_portal_id [dotlrn_community::get_portal_id]
    }

    set element_pretty_name [parameter::get \
                              -parameter admin_portlet_element_pretty_name \
                              -default [_ learning-content.admin_portlet_element_pretty_name]]

    array set config $cf

    set applet_url [apm_package_url_from_id $config(package_id)]

}
