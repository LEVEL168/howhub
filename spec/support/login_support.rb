module LoginSupport
  def login(user)
    fill_in name="mail", with: user.mail
    fill_in name="password", with: user.password
    click_button 'ログイン'
  end
end

# craftなど他のテストをする際に使用するメソッド