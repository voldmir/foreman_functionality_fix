# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "hostgroups/index",
  :name => "hostgroups_index_description_title",
  :insert_after => "th:contains('Hosts including Sub-groups')",
  :text => "\n    <th width=\"650px\"><%= _(\"Description\") %></th>",
)

Deface::Override.new(
  :virtual_path => "hostgroups/index",
  :name => "hostgroups_index_description_content",
  :insert_after => "td:contains('children_hosts_count')",
  :text => "\n    <td><%= hostgroup.description %></td>",
)

Deface::Override.new(
  virtual_path: "hostgroups/index",
  name: "hostgroups_index_name_title",
  replace: "th:contains('Hostgroup|Name')",
  text: "\n    <th width=\"500px\"><%= sort :label, :as => _('Hostgroup|Name') %></th>",
  original: "<th><%= sort :label, :as => _('Hostgroup|Name') %></th>",
)

Deface::Override.new(
  virtual_path: "hostgroups/index",
  name: "hostgroups_index_actions_title",
  replace: "th:contains('Actions')",
  text: "\n    <th width=\"120px\"><%= _('Actions') %></th>",
  original: "<th><%= _('Actions') %></th>",
)

Deface::Override.new(
  virtual_path: "hostgroups/index",
  name: "hostgroups_index_hosts_sub_group_title",
  replace: "th:contains('Hosts including Sub-groups')",
  text: "\n    <th width=\"190px\"><%= _('Hosts including Sub-groups') %></th>",
  original: "<th><%= _('Hosts including Sub-groups') %></th>",
)
