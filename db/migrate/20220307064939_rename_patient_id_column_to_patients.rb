class RenamePatientIdColumnToPatients < ActiveRecord::Migration[7.0]
  def change
    rename_column :patients, :patient_id, :patientid
  end
end
