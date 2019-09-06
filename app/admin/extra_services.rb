ActiveAdmin.register ExtraService do
  permit_params :reservation_id, :name
  index do
    selectable_column
    id_column
    column :reservation
    column :name
    actions
  end

  filter :reservation_id
  filter :name

  form do |f|
  f.inputs do
    f.input :reservation_id,
            as: :select,
            collection: Reservation.joins(:user).pluck('users.email', 'id'),
            include_blank: 'Seleccion reservation'
    f.input :name
  end
  f.actions
  end
end
