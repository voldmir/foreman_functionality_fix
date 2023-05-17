# frozen_string_literal: true

require "deface"

module ForemanFunctionalityFix
  class Engine < ::Rails::Engine
    engine_name "foreman_functionality_fix"

    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    initializer "foreman_functionality_fix.register_gettext",
                after: :load_config_initializers do
      locale_dir = File.join(File.expand_path("../..", __dir__), "locale")
      locale_domain = "foreman_functionality_fix"

      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end

    initializer "foreman_functionality_fix.register_plugin", before: :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_functionality_fix do
        requires_foreman "~> 1.24"

        delete_menu_item :top_menu, :newhost
        delete_menu_item :top_menu, :hosts

        menu :top_menu,
             :hosts,
             caption: N_("All"),
             parent: :hosts_menu

        unless SETTINGS[:unattended]
          menu :top_menu,
               :operatingsystems,
               caption: N_("Operating Systems"),
               parent: :configure_menu,
               after: :common_parameters
        end
      end
    end

    config.to_prepare do
      ::AncestryHelper.prepend ForemanFunctionalityFix::AncestryHelperExt
      ::PuppetRelatedHelper.prepend ForemanFunctionalityFix::PuppetRelatedHelperExt
      ::HostDescriptionHelper.prepend ForemanFunctionalityFix::HostDescriptionHelperExt
    rescue StandardError => e
      Rails.logger.warn "ForemanFunctionalityFix: skipping engine hook (#{e})"
    end
  end
end
