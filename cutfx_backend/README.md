# Date: 13 September 2024 

## Summary
- Flutterwave : Payment Gateways Removed due to non-maintained package

#### Updated Files
- [settings.blade.php](resources/views/settings.blade.php)

#### Added Files
None

#### Removed Files
None

#### Database
None 

------------------------------------
# Date: 1 August 2024 

## Summary
- SSLCommerze : Payment Gateways Added
- Other Payment Gateways Library updates
- Few more updates & optimization

#### Updated Files
- [SettingsController.php](app/Http/Controllers/SettingsController.php)
- [settings.blade.php](resources/views/settings.blade.php)
- [Constants.php](app/Models/Constants.php)
- [GlobalFunction.php](app/Models/GlobalFunction.php)

#### Added Files
None

#### Removed Files
None

#### Database
- global_settings : fields added : sslcommerz_store_id, sslcommerz_currency_code, sslcommerz_store_passwd, 

------------------------------------
# Date: 22/04/2024

## Summary
- Pay After Service Option added
- Serve At My Location address added
- Choose Barber Options added

#### Updated Files
- [BookingsController.php](App/Http/Controllers/BookingsController.php)
- [SalonController.php](App/Http/Controllers/SalonController.php)
- [ServiceController.php](App/Http/Controllers/ServiceController.php)
- [SettingsController.php](App/Http/Controllers/SettingsController.php)
- [UsersController.php](App/Http/Controllers/UsersController.php)

- [Bookings.php](App/Models/Bookings.php)
- [Constants.php](App/Models/Constants.php)
- [GlobalFunction.php](App/Models/GlobalFunction.php)
- [Salons.php](App/Models/Salons.php)

- [viewSalon.js](Public/asset/script/viewSalon.js)
- [viewBookingDetails.css](Public/asset/style/viewBookingDetails.css)

- [salons.blade.php](Resources/views/salons.blade.php)
- [viewBookingDetails.blade.php](Resources/views/viewBookingDetails.blade.php)
- [viewSalon.blade.php](Resources/views/viewSalon.blade.php)
- [app.blade.php](Resources/views/include/app.blade.php)

- [api.php](Routes/api.php)
- [web.php](Routes/web.php)

#### Added Files
- [Staff.php](App/Models/Staff.php)
- [UserAddress.php](App/Models/UserAddress.php)

- [staff.js](Public/asset/script/staff.js)
- [viewStaff.js](Public/asset/script/viewStaff.js)

- [viewStaff.blade.php](Resources/views/viewStaff.blade.php)
- [staff.blade.php](Resources/views/staff.blade.php)

#### Database
- salon_staff : new table
- user_address : new table
- bookings : fields added : staff_id, service_location, address_id, payment_type
- salon : fields added : is_pay_after_service, is_serve_outside

