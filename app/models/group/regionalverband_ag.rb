# frozen_string_literal: true

#  Copyright (c) 2012-2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.

class Group::RegionalverbandAg < ::Group
  class Sprecher < ::Role
    self.permissions = [:group_full, :contact_data]
  end

  class Mitglied < ::Role
    self.permissions = [:group_read]
  end

  roles Sprecher, Mitglied
end
