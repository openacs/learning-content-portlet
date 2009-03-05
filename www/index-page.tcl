ad_page_contract {
    page_id:optional
    content_id:optional
    @author byron Haroldo Linares Roman (bhlr@byronLs-Computer.local)
    @creation-date 2007-07-25
}
set wiki_url "[ad_conn package_url]"
set user_id [ad_conn user_id]
set admin_p [dotlrn::user_can_admin_community_p -user_id $user_id \
    -community_id [dotlrn_community::get_community_id]]
set headerurl "${wiki_url}header_page"

