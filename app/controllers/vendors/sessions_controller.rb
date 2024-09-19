class Vendors::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user_or_vendor!

end
