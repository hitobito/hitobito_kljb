# frozen_string_literal: true

#  Copyright (c) 2012-2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.


class Group::Ortsgruppe < ::Group
  self.layer = true

  self.default_children = [
    Group::OrtsgruppeVorstand,
    Group::OrtsgruppeKontakte,
    Group::OrtsgruppeLeiterrunde
  ]

  self.possible_children = [Group::OrtsgruppeAg]

  children(*default_children)

  class Foerdermitglied < ::Role
    self.visible_from_above = false
    self.kind = :passive
    self.permissions = []
  end

  class Mitglied < ::Role
    self.permissions = [:group_read]
  end

  roles Foerdermitglied, Mitglied
end
