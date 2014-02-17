module AuthenticationHelpers
  def login_with(resource)
    namespace = resource.class.to_s.downcase

    visit "/#{namespace.pluralize}/sign_in"

    fill_in "#{namespace}[email]", with: resource.email
    fill_in "#{namespace}[password]", with: resource.password

    click_button 'Sign in'
    
  end
  
end
