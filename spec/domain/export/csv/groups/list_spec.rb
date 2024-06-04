# frozen_string_literal: true

#  Copyright (c) 2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.

require 'spec_helper'
require 'csv'

describe Export::Tabular::Groups::List do

  let(:group) { groups(:nord) }

  let(:list) { group.self_and_descendants.without_deleted.includes(:contact) }
  let(:data) { described_class.csv(list) }
  let(:data_without_bom) { data.gsub(Regexp.new("^#{Export::Csv::UTF8_BOM}"), '') }
  let(:csv) { CSV.parse(data_without_bom, headers: true, col_sep: Settings.csv.separator) }

  subject { csv }

  it 'has the correct headers' do
    expected = ['Id',
                'Elterngruppe',
                'Name',
                'Kurzname',
                'Gruppentyp',
                'Haupt-E-Mail',
                'PLZ',
                'Ort',
                'Land',
                'Geändert',
                'Ebene',
                'Beschreibung',
                'Link zu Nextcloud',
                'Strasse',
                'Hausnummer',
                'zusätzliche Adresszeile',
                'Postfach',
                'normale Mitglieder',
                'vergünstigte Mitglieder',
                'Telefonnummern',
                'Anzahl Mitglieder',
                'Social Media']

    expect(subject.headers).to match_array expected
    expect(subject.headers).to eq expected
  end

  it 'has 4 items' do
    expect(subject.size).to eq(16)
  end

  context 'first row' do
    subject { csv[0] }

    its(['Id']) { should == group.id.to_s }
    its(['Elterngruppe']) { should == group.parent_id&.to_s }
    its(['Name']) { should == group.name }
    its(['Kurzname']) { should == group.short_name }
    its(['Gruppentyp']) { should == 'Regionalverband' }
    its(['Haupt-E-Mail']) { should == group.email }
    its(['zusätzliche Adressezeile']) { should == group.address_care_of }
    its(['Strasse']) { should == group.street }
    its(['Hausnummer']) { should == group.housenumber }
    its(['Postfach']) { should == group.postbox }
    its(['PLZ']) { should == group.zip_code.to_s }
    its(['Ort']) { should == group.town }
    its(['Land']) { should == group.country_label }
    its(['Ebene']) { should == group.id.to_s }
    its(['normale Mitglieder']) { should be_blank }
    its(['vergünstigte Mitglieder']) { should be_blank }
  end

  context 'group with members' do
    subject { csv.find { |row| row['Name'] == group_with_members.name } }
    let(:group_with_members) { groups(:paderborn) }

    before do
      group_with_members.update!(
        members_normal: 23,
        members_discounted: 7
      )
    end

    its(['Gruppentyp']) { should == 'Ortsgruppe' }
    its(['normale Mitglieder']) { should == '23' }
    its(['vergünstigte Mitglieder']) { should == '7' }
  end
end
