ActiveAdmin.register User do
  permit_params :email, :password, :name, :last_name, :phone, :rut
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :last_name
    column :phone
    column :rut
    actions
  end

  filter :email
  filter :name
  filter :last_name
  filter :phone
  filter :rut

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :last_name
      f.input :phone
      f.input :rut
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
