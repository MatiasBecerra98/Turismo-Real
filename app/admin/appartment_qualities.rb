ActiveAdmin.register AppartmentQuality do
  permit_params :appartment_id, :cable, :conditioned_air, :internet,
                :calefaction, :created_at, :updated_at
  index do
    selectable_column
    id_column
    column :appartment_id
    column :cable
    column :conditioned_air
    column :internet
    column :calefaction
    column :created_at
    actions
  end

  filter :appartment_id
  filter :cable
  filter :conditioned_air
  filter :internet
  filter :calefaction
  filter :created_at

  form do |f|
    f.inputs do
      f.input :appartment_id,
              as: :select, collection:
              Appartment.all.pluck('id'),
              include_blank: 'Seleccione Departamento',
              input_html: { style: 'min-width: 100px;' }
      f.input :cable
      f.input :conditioned_air
      f.input :internet
      f.input :calefaction
    end
    f.actions
  end
end
