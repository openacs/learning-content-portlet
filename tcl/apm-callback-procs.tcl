ad_library {

    @author Alvaro Rodriguez (alvaro@viaro.net)
    @creation-date 2008-08-08
}

namespace eval learning-content-portlet::apm {}

ad_proc -public learning-content-portlet::apm::package_mount { 
    {-package_id:required}
    {-node_id:required}
} {
    Check if packages needed are mounted, if not mount them!
} {
    set package_parent_id [site_node::get_parent_id -node_id $node_id]
    set package_community_id [site_node::get_object_id -node_id $package_parent_id]
    set community_id [dotlrn_community::get_community_id -package_id $package_community_id]
    set community_url [dotlrn_community::get_community_url $community_id]

    #check if assessment is mounted, if not mount it
    set activity "assessment"
    if {![site_node::exists_p -url "${community_url}${activity}" ]} {
        dotlrn_community::add_applet_to_community $community_id dotlrn_assessment
    }
    #check if evaluation is mounted, if not mount it
    set activity "evaluation"
    if {![site_node::exists_p -url "${community_url}${activity}"]} {
        dotlrn_community::add_applet_to_community $community_id dotlrn_evaluation
    }
}
