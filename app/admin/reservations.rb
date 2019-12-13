ActiveAdmin.register Reservation do
  permit_params :user_id, :appartment_id, :starting_date, :ending_date,
                :total_cost, :paid
  index do
    selectable_column
    id_column
    column :user
    column :appartment_id
    column :starting_date
    column :ending_date
    column :total_cost
    column :paid
    column :status
    actions
    
  
    column "Check In" do |resource|
      if !resource.check_in
        link_to("<i class='material-icons'>check_circle</i>".html_safe,
          check_in_path(id: resource.id),
          method: :post
        )
      else
        if resource.pdf.attached?
          link_to("<i class='material-icons'>picture_as_pdf</i>".html_safe,
            polymorphic_url(resource.pdf),
            method: :get
          )
        end
      end
    end

    column "Check Out" do |resource|
      if !resource.check_out && resource.check_in
        link_to("<i class='material-icons'>arrow_right_alt</i>".html_safe,
          check_out_path(id: resource.id),
          method: :post
        )
      end
    end
  end

  filter :user_id
  filter :appartment_id
  filter :starting_date
  filter :ending_date
  filter :total_cost
  filter :paid
  filter :status

  form do |f|
    f.inputs do
      f.input :user,
              as: :select,
              collection: User.pluck('email', 'id'),
              include_blank: 'Seleccione Usuario'
      f.input :appartment_id,
              as: :select, collection:
              Appartment.all.pluck('id'),
              include_blank: 'Seleccione Departamento',
              input_html: { style: 'min-width: 100px;' }
      f.input :starting_date
      f.input :ending_date
      f.input :total_cost
      f.input :paid
      f.input :status
    end
    f.actions
  end
end
