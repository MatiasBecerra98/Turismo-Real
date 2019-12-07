ActiveAdmin.register ExtraService do
  permit_params :reservation_id, :service_id
  index do
    selectable_column
    id_column
    column :reservation
    column 'Servicio' do |extra_service|
      link_to(Service.find(extra_service.service_id).name,"/admin/services/#{extra_service.service_id}")
    end
    actions
  end

  filter :reservation_id
  filter :service_id

  form do |f|
  f.inputs do
    f.input :reservation_id,
            as: :select,
            collection: Reservation.joins(:user).pluck('users.email', 'id'),
            include_blank: 'Seleccion reservation'
    f.input :service_id,
            as: :select,
            collection: Service.where(status: true).pluck('name', 'id'),
            include_blank: 'Seleccione servicio'
  end
  f.actions
  end
end
