def reset_solidus_crm_preferences
  Spree::CrmConfig.crm_endpoint = 'www.example.com'
end
