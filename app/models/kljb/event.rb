# frozen_string_literal: true

#  Copyright (c) 2012-2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.

module Kljb::Event
  extend ActiveSupport::Concern

  included do
    self.role_types = [Event::Role::Leader,
      Event::Role::Teamer,
      Event::Role::Helper,
      Event::Role::Participant]
  end
end
