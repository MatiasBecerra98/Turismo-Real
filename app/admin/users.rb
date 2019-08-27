ActiveAdmin.register User do
  permit_params :email, :password
  index do
    selectable_column
    id_column
    column :email
    column :profile_id
    actions
  end

  filter :email
  filter :profile_id

  form do |f|
    f.inputs do
      f.input :email
      f.input :profile_id
      f.input :password
    end
    f.actions
  end
end
