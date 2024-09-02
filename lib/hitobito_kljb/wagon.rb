# frozen_string_literal: true

#  Copyright (c) 2012-2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.

module HitobitoKljb
  class Wagon < Rails::Engine
    include Wagons::Wagon

    # Set the required application version.
    app_requirement ">= 0"

    # Add a load path for this specific wagon
    config.autoload_paths += %W[
      #{config.root}/app/abilities
      #{config.root}/app/domain
      #{config.root}/app/jobs
    ]

    config.to_prepare do
      JobManager.wagon_jobs += [MemberPaymentStatusJob]

      # extend application classes here
      Group.include Kljb::Group
      Person.include Kljb::Person
      Event.include Kljb::Event

      Event::ParticipationContactData.include Kljb::Event::ParticipationContactData
    end

    initializer "kljb.add_settings" do |_app|
      Settings.add_source!(File.join(paths["config"].existent, "settings.yml"))
      Settings.reload!
    end

    initializer "kljb.add_inflections" do |_app|
      ActiveSupport::Inflector.inflections do |inflect|
        # inflect.irregular 'census', 'censuses'
      end
    end

    private

    def seed_fixtures
      fixtures = root.join("db", "seeds")
      ENV["NO_ENV"] ? [fixtures] : [fixtures, File.join(fixtures, Rails.env)]
    end
  end
end
