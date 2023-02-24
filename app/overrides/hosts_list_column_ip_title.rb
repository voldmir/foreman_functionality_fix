# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "hosts/_list",
  :name => "title_ip",
  :insert_after => "th:contains('Name')",
  :text => "\n    <th class=\"hidden-tablet hidden-phone\" width=\"120px\"><%= sort :ip, :as => _(\"IP\") %></th>",
)
