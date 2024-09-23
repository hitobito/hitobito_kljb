# Hitobito Kljb

This hitobito wagon defines the organization hierarchy with groups and roles
of Kljb.

:warn: For now, this repo has been archived. It can be reactivated if needed.

## Organization Hierarchy

* Diözesanverband
  * Diözesanverband
    * Fördermitglied: []
    * IT-Support: [:admin, :impersonation, :layer_and_below_full]
  * Diözesanvorstand
    * Seelsorger*in: [:layer_and_below_full, :contact_data]
    * Vorstand: [:layer_and_below_full, :contact_data]
    * Beratend: [:layer_read]
  * Büro
    * Verwaltungsleitung: [:layer_and_below_full, :contact_data]
    * Referent*in: [:layer_and_below_full, :contact_data]
    * Sekretariat: [:layer_and_below_full, :contact_data]
    * Mitarbeiter*in: [:layer_and_below_read, :layer_full]
  * AG
    * Sprecher*in: [:group_full, :contact_data]
    * Mitglied: [:group_read]
  * Kontakte
    * Kontakt: []
    * Teamer*in: []
* Regionalverband
  * Regionalverband
    * Fördermitglied: []
  * Vorstand
    * Vorsitz: [:layer_and_below_full, :contact_data]
    * Geist: [:layer_and_below_full, :contact_data]
    * Finanzverantwortliche*r: [:layer_and_below_full, :contact_data]
    * Mitglied: [:layer_full, :layer_and_below_read, :contact_data]
  * AG
    * Sprecher*in: [:group_full, :contact_data]
    * Mitglied: [:group_read]
  * Kontakte
    * Kontakt: []
* Ortsgruppe
  * Ortsgruppe
    * Fördermitglied: []
    * Mitglied: [:group_read]
  * Vorstand
    * Vorsitz: [:layer_and_below_full, :contact_data]
    * Geist: [:layer_and_below_full, :contact_data]
    * Finanzverantwortliche*r: [:layer_and_below_full, :contact_data]
    * Mitglied: [:layer_full, :layer_and_below_read, :contact_data]
  * AG
    * Sprecher*in: [:group_full, :contact_data]
    * Mitglied: [:group_read]
  * Kontakte
    * Kontakt: []
  * Leiterrunde
    * Leiter*in: [:layer_and_below_read]

(Output of rake app:hitobito:roles)
