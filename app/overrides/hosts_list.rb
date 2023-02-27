# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "hosts/_list",
  name: "hosts_list_column_name_title",
  replace: "th:contains('Name')",
  text: "\n    <th width=\"15%\"><%= sort :name, :as => _('Name') %></th>",
  original: "<th width=\"25%\"><%= sort :name, :as => _('Name') %></th>",
)

Deface::Override.new(
  virtual_path: "hosts/_list",
  name: "hosts_list_column_model",
  replace: "td:contains('host.compute_resource_or_model')",
  text: "\n    <td class=\"hidden-tablet hidden-xs ellipsis\"><%= host.try(:organization) %></td>",
  original: '<td class="hidden-tablet hidden-xs ellipsis"><%= host.compute_resource_or_model %></td>',
)

Deface::Override.new(
  virtual_path: "hosts/_list",
  name: "hosts_list_column_model_title",
  replace: "th:contains('Model')",
  text: "\n    <th class=\"hidden-tablet hidden-xs\" width=\"20%\"><%= sort :organization, :as => _(\"Organization\") %></th>",
  original: "<th class=\"hidden-tablet hidden-xs\" width=\"10%\"><%= sort :model, :as => _('Model') %></th>",
)

Deface::Override.new(
  :virtual_path => "hosts/_list",
  :name => "hosts_list_title_ip",
  :insert_after => "th:contains('Name')",
  :text => "\n    <th class=\"hidden-tablet hidden-phone\" width=\"120px\"><%= sort :ip, :as => _(\"IP\") %></th>",
)

Deface::Override.new(
  :virtual_path => "hosts/_list",
  :name => "hosts_list_content_ip",
  :insert_after => "td:contains('name_column')",
  :text => "\n    <td class=\"hidden-tablet hidden-phone ellipsis\"><%= label_host_content_ip(host) %></td>",
)

Deface::Override.new(
  virtual_path: "hosts/_list",
  name: "hosts_list_column_hostgroup",
  replace: "td:contains('host.hostgroup')",
  text: "\n    <td class=\"hidden-tablet hidden-xs\"><%= label_with_link_hostgroup host.hostgroup, 23, @hostgroup_authorizer %></td>",
  original: '<td class="hidden-tablet hidden-xs"><%= label_with_link host.hostgroup, 23, @hostgroup_authorizer %></td>',
)

Deface::Override.new(
  virtual_path: "hosts/_list",
  name: "hosts_list_actions",
  replace: "erb[loud]:contains('action_buttons')",
  text: '<%= action_buttons(link_to(_("Properties"), host_path(host))) %> ',
  original: "<%= action_buttons(
                            display_link_if_authorized(_(\"Edit\"), hash_for_edit_host_path(:id => host).merge(:auth_object => host, :authorizer => authorizer)),
                            display_link_if_authorized(_(\"Clone\"), hash_for_clone_host_path(:id => host)),
                            display_delete_if_authorized(hash_for_host_path(:id => host).merge(:auth_object => host, :authorizer => authorizer), :data => { :confirm => delete_host_dialog(host) }, :action => :destroy))%>",
)
