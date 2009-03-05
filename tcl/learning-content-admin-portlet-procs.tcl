ad_library {

    Procedures to support the content ADMIN portlet

    @author bhlr@galileo.edu

}

namespace eval learning_content_admin_portlet {

    ad_proc -private get_my_name {
    } {
        return "learning_content_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return [parameter::get_from_package_key \
                    -package_key [my_package_key] \
                    -parameter admin_portlet_pretty_name]
    }

    ad_proc -private my_package_key {
    } {
        return "learning-content-portlet"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Adds a content admin PE to the given portal
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id
        ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
    } {
        Removes content PE from the given page
    } {
        # This is easy since there's one and only one instace_id
        portal::remove_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name]
    }

    ad_proc -public show {
        cf
    } {
        Display the PE
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "learning-content-admin-portlet"
    }
}
