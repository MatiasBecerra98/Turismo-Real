ActiveAdmin.register Reservation do
  permit_params :user_id, :appartment_id, :starting_date, :ending_date,
                :total_cost, :paid
  index do
    selectable_column
    id_column
    column :user_id
    column :appartment_id
    column :starting_date
    column :ending_date
    column :total_cost
    column :paid
    actions
  end

  filter :user_id
  filter :appartment_id
  filter :starting_date
  filter :ending_date
  filter :total_cost
  filter :paid

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :appartment_id
      f.input :starting_date
      f.input :ending_date
      f.input :total_cost
      f.input :paid
    end
    f.actions
  end
end
