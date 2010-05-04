module SessionsHelper
  
  def sign_in(patient)
    patient.remember_me!
    cookies[:remember_token] = {  :value => patient.remember_token, 
                                  :expires => 70.years.from_now.utc }
    self.current_patient = patient                              
  end

  def current_patient=(patient)
    @current_patient = patient
  end
  
  def current_patient
    @current_patient ||= patient_from_remember_token
  end
  
  def patient_from_remember_token
    remember_token = cookies[:remember_token]
    Patient.find_by_remember_token(remember_token) unless remember_token.nil?
  end
  
  def signed_in?
    !current_patient.nil?
  end
  
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_patient = nil
  end
  
  def current_patient?(patient)
    patient == current_patient
  end
  
  def deny_access
    store_location
    flash[:notice] = "Please sign in to access this page."
    redirect_to signin_path
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  def clear_return_to
    session[:return_to] = nil
  end
end
