<script src="/resources/learning-content-portlet/content-admin-portlet.js" type="text/javascript"></script>
<ul>
<li>#learning-content.go_to# <a href='@applet_url@'>#learning-content.content#</a><br /></li>
<li><a href="@applet_url@content-admin/category-view?package_id=@package_id@">#learning-content.edit_content_index# </a></li>
<li><p><a href="@applet_url@content-admin/">#learning-content.admin_content_options#</a></p></li>
<if @package_id@ eq "">
  <small>No community specified</small>
</if>
