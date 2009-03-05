array set config $cf
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set community_id [dotlrn_community::get_community_id]

set content_url [site_node::get_url_from_object_id -object_id $config(package_id)]

set url "${content_url}categories"

