ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Cantidad de reservaciones totales" do
          ul do
            Reservation.all.count
          end
        end
      end
      column do
        panel "Cantidad de reservaciones activas" do
          ul do
            Reservation.where(status: true).count
          end
        end
      end
      column do
        panel "Cantidad de reservaciones inactivas" do
          ul do
            Reservation.where(status: false).count
          end
        end
      end
      column do
        panel "Cantida usuarios" do
          ul do
            User.all.count
          end
        end
      end
    end
    columns do
      column do
        panel "Cantidad de departamentos" do
          ul do
            Appartment.all.count
          end
        end
      end
    end
  end
end
