# frozen_string_literal: true

#  Copyright (c) 2012-2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.

class Group::DioezesanverbandBuero < ::Group
  class Verwaltungsleitung < ::Role
    self.permissions = [:layer_and_below_full, :contact_data]
  end

  class Referent < ::Role
    self.permissions = [:layer_and_below_full, :contact_data]
  end

  class Sekretariat < ::Role
    self.permissions = [:layer_and_below_full, :contact_data]
  end

  class Mitarbeiter < ::Role
    self.permissions = [:layer_and_below_read, :layer_full]
  end

  roles Verwaltungsleitung, Referent, Sekretariat, Mitarbeiter
end
