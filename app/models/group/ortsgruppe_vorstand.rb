# frozen_string_literal: true

#  Copyright (c) 2012-2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.

class Group::OrtsgruppeVorstand < ::Group
  class Vorsitz < ::Role
    self.permissions = [:layer_and_below_full, :contact_data]
  end

  class Geist < ::Role
    self.permissions = [:layer_and_below_full, :contact_data]
  end

  class Finanzverantwortlicher < ::Role
    self.permissions = [:layer_and_below_full, :contact_data]
  end

  class Mitglied < ::Role
    self.permissions = [:layer_full, :layer_and_below_read, :contact_data]
  end

  roles Vorsitz, Geist, Finanzverantwortlicher, Mitglied
end
