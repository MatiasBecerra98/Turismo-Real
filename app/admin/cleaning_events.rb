ActiveAdmin.register CleaningEvent do
  permit_params :appartment_id, :time_of_event, :janitor_id, :reminder_sent
  index do
    selectable_column
    id_column
    column :appartment_id
    column :time_of_event
    column :janitor
    column :reminder_sent
    actions
  end

  filter :appartment_id
  filter :time_of_event
  filter :janitor_id
  filter :reminder_sent

  form do |f|
    f.inputs do
      f.input :appartment_id,
              as: :select, collection:
              Appartment.all.pluck('id'),
              include_blank: 'Seleccione Departamento',
              input_html: { style: 'min-width: 100px;' }
      f.input :time_of_event
      f.input :janitor_id,
              as: :select,
              collection: Janitor.all,
              label_method: :name, value_method: :id,
              include_blank: 'Seleccione Janitor'

      f.input :reminder_sent
    end
    f.actions
  end
end
