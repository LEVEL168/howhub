module LoginSupportModule
  def login_support_module_as(user)
    session_params = { session: { mail: user.mail, password: user.password } }
    post "/login", params: session_params
  end
end