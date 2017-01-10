def reset_solidus_crm_preferences
  Spree::CrmConfig.crm_endpoint = 'http://www.example.com'
end
