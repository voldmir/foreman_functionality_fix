# frozen_string_literal: true

module ForemanFunctionalityFix
  module AncestryHelperExt
    extend ActiveSupport::Concern

    def label_with_link_hostgroup(obj, max_length = 1000, authorizer = nil)
      return if obj.blank?

      name = obj.name.split("/")[0]
      return if name.nil?

      link_to_if_authorized(
        content_tag(:span, name, { :'data-original-title' => obj.title, :rel => "twipsy" }),
        send("hash_for_edit_#{obj.class.name.to_s.tableize.singularize}_path", obj).merge(:auth_object => obj, :authorizer => authorizer)
      )
    end

    def label_host_content_ip(obj)
      return "#{obj.facts["ipaddress"]}"
    end
  end
end
