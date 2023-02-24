# frozen_string_literal: true

Deface::Override.new(
  :virtual_path => "hosts/_list",
  :name => "content_ip",
  :insert_after => "td:contains('name_column')",
  :text => "\n    <td class=\"hidden-tablet hidden-phone ellipsis\"><%= label_host_content_ip(host) %></td>",
)
