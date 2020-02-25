class AddJobTitleToWorkHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :work_histories, :job_title, :string
    rename_column :work_histories, :name, :company_name
  end
end
