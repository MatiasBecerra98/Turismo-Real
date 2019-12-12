ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span 'Reporte de recursos'
        small link_to(
          'Reporte',
          reporting_excell_path,
          method: :post,
          format: :xlsx
        )
      end
    end
  end
end
