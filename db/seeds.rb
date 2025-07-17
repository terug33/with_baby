Admin.find_or_create_by!(email: 'hirose@gmail.com') do |admin|
  admin.name = '廣瀬'
  admin.password = 'hirose'
  admin.password_confirmation = 'hirose'
end 
