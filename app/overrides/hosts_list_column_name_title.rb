# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "hosts/_list",
  name: "hosts_list_column_name_title",
  replace: "th:contains('Name')",
  text: "\n    <th width=\"15%\"><%= sort :name, :as => _('Name') %></th>",
  original: "<th width=\"25%\"><%= sort :name, :as => _('Name') %></th>",
)
