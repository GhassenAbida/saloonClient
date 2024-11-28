# ---Date: 16 Oct, 2024---

## Summary

-Solve Paypal Payment Issue

#### Added Files

None

#### Deleted Files

None

#### Updated Files

bloc
-[payment_gateway.dart](lib/bloc/confirmbooking/payment_gateway.dart)
-[recharge_wallet_bloc.dart](lib/bloc/recharge/recharge_wallet_bloc.dart)

lib
-[main.dart](lib/main.dart)

#### Note: Don't forget to change your credentials after updating file.

----------------------------------------------------------------------------------------------------
# ---Date: 13 Sep, 2024---

## Summary

-Remove FlutterWave Sdk

#### Added Files

None

#### Deleted Files

None

#### Updated Files

bloc
-[payment_gateway.dart](lib/bloc/confirmbooking/payment_gateway.dart)
-[recharge_wallet_bloc.dart](lib/bloc/recharge/recharge_wallet_bloc.dart)
-[salon_on_map_bloc.dart](lib/bloc/salononmap/salon_on_map_bloc.dart)

lib
-[pubspec.yaml](pubspec.yaml)

#### Note: Don't forget to change your credentials after updating file.

----------------------------------------------------------------------------------------------------

# ---Date: 1 Aug, 2024---

## Summary

-Update Payment Gateways (Add SslCommerz Payment)
-Solved Issue of Slot's Sorting

#### Added Files

None

#### Deleted Files

None

#### Updated Files

bloc
-[bookings_bloc.dart](lib/bloc/bookings/bookings_bloc.dart)
-[recharge_wallet_bloc.dart](lib/bloc/recharge/recharge_wallet_bloc.dart)
-[re_schedule_bloc.dart](lib/bloc/reschedule/re_schedule_bloc.dart)
-[payment_gateway.dart](lib/bloc/confirmbooking/payment_gateway.dart)

model
-[setting.dart](lib/model/setting/setting.dart)

screens
-[confirm_booking.dart](lib/screens/booking)
-[reschedule_bottom_sheet.dart](lib/screens/bookingdetail/reschedule_bottom_sheet.dart)

service
-[api_service.dart](lib/service/api_service.dart)

lib
-[pubspec.yaml](pubspec.yaml)

Android
-[settings.gradle](android/settings.gradle)

#### Note: Don't forget to change your credentials after updating file.

----------------------------------------------------------------------------------------------------

# ---Date: 22 June, 2024---

# -Pay After Service Option added-

# -Serve At My Location address added-

# -Choose Barber Options added-

# **Added Files**

images
-[ic_menu_2.png](images/ic_menu_2.png)
-[ic_navigator2.png](images/ic_navigator2.png)
-[ic_user.png](images/ic_user.png)

bloc
-[add_address_bloc.dart](lib/bloc/address/add_address_bloc.dart)
-[add_address_event.dart](lib/bloc/address/add_address_event.dart)
-[add_address_state.dart](lib/bloc/address/add_address_state.dart)
-[manage_address_bloc.dart](lib/bloc/manageaddress/manage_address_bloc.dart)
-[manage_address_event.dart](lib/bloc/manageaddress/manage_address_event.dart)
-[manage_address_state.dart](lib/bloc/manageaddress/manage_address_state.dart)
-[manage_staff_bloc.dart](lib/bloc/choosestaff/manage_staff_bloc.dart)
-[manage_staff_event.dart](lib/bloc/choosestaff/manage_staff_event.dart)
-[manage_staff_state.dart](lib/bloc/choosestaff/manage_staff_state.dart)

model
-[staff.dart](lib/model/staff)
-[address.dart](lib/model/address/address.dart)

screens
-[add_addresses_screen.dart](lib/screens/address/add_addresses_screen.dart)
-[choose_barber_screen.dart](lib/screens/barber/choose_barber_screen.dart)
-[manage_my_addresses.dart](lib/screens/address/manage_my_addresses.dart)
-[map_screen.dart](lib/screens/map/map_screen.dart)
-[map_screen_controller.dart](lib/screens/map/map_screen_controller.dart)
-[salon_staff_page.dart](lib/screens/salon/salon_staff_page.dart)

# **Updated Files**

# *Android*

-[build.gradle](android/app/build.gradle)

# *iOS*

-[Info.plist](ios/Runner/Info.plist)

# *Flutter*

bloc
-[bookings_bloc.dart](lib/bloc/bookings/bookings_bloc.dart)
-[confirm_booking_bloc.dart](lib/bloc/confirmbooking/confirm_booking_bloc.dart)
-[login_bloc.dart](lib/bloc/login/login_bloc.dart)

model
-[salon.dart](lib/model/user/salon.dart)
-[booking.dart](lib/model/bookings/booking.dart)

screens
-[booking_detail_screen.dart](lib/screens/bookingdetail/booking_detail_screen.dart)
-[confirm_booking.dart](lib/screens/booking/confirm_booking.dart)
-[make_payment_screen.dart](lib/screens/payment/make_payment_screen.dart)
-[profile_screen.dart](lib/screens/profile/profile_screen.dart)
-[salon_details_screen.dart](lib/screens/salon/salon_details_screen.dart)
-[salon_screen.dart](lib/screens/fav/salon_screen.dart)
-[salon_services_page.dart](lib/screens/salon/salon_services_page.dart)
-[service_screen.dart](lib/screens/fav/service_screen.dart)
-[wallet_screen.dart](lib/screens/wallet/wallet_screen.dart)

service
-[api_service.dart](lib/service/api_service.dart)

utils
-[app_res.dart](lib/utils/app_res.dart)
-[asset_res.dart](lib/utils/asset_res.dart)
-[const_res.dart](lib/utils/const_res.dart)
-[custom_widget.dart](lib/utils/custom/custom_widget.dart)

l10n
-[intl_ar.arb](lib/l10n/intl_ar.arb)
-[intl_da.arb](lib/l10n/intl_da.arb)
-[intl_de.arb](lib/l10n/intl_de.arb)
-[intl_el.arb](lib/l10n/intl_el.arb)
-[intl_en.arb](lib/l10n/intl_en.arb)
-[intl_es.arb](lib/l10n/intl_es.arb)
-[intl_fr.arb](lib/l10n/intl_fr.arb)
-[intl_hi.arb](lib/l10n/intl_hi.arb)
-[intl_id.arb](lib/l10n/intl_id.arb)
-[intl_it.arb](lib/l10n/intl_it.arb)
-[intl_ja.arb](lib/l10n/intl_ja.arb)
-[intl_ko.arb](lib/l10n/intl_ko.arb)
-[intl_nb.arb](lib/l10n/intl_nb.arb)
-[intl_nl.arb](lib/l10n/intl_nl.arb)
-[intl_pl.arb](lib/l10n/intl_pl.arb)
-[intl_pt.arb](lib/l10n/intl_pt.arb)
-[intl_ru.arb](lib/l10n/intl_ru.arb)
-[intl_th.arb](lib/l10n/intl_th.arb)
-[intl_tr.arb](lib/l10n/intl_tr.arb)
-[intl_vi.arb](lib/l10n/intl_vi.arb)
-[intl_zh.arb](lib/l10n/intl_zh.arb)

lib
-[main.dart](lib/main.dart)
-[pubspec.yaml](pubspec.yaml)

## Note: Don't forget to change your credentials after updating file.

----------------------------------------------------------------------------------------------------

# ******* Date: 28 May, 2024 *******

# -Update pubspec.yaml & Gradle File.-

# -Change library of PayStack Payment gateway & Flutter Cluster Manager.-

# -Bug Fixes.-

# **Updated Files**

#android
-[build.gradle](./android/app/build.gradle)
-[build.gradle](./android/build.gradle)
-[gradle.properties](./android/gradle.properties)
-[gradle-wrapper.properties](./android/gradle/wrapper/gradle-wrapper.properties)
-[AndroidManifest.xml](./android/app/src/main/AndroidManifest.xml)
-[settings.gradle](./android/settings.gradle)
#flutter
-[bookings_bloc.dart](lib/bloc/bookings/bookings_bloc.dart)
-[payment_gateway.dart](lib/bloc/confirmbooking/payment_gateway.dart)
-[recharge_wallet_bloc.dart](lib/bloc/recharge/recharge_wallet_bloc.dart)
-[salon_details_bloc.dart](lib/bloc/salon/salon_details_bloc.dart)
-[welcome_screen.dart](lib/screens/welcome/welcome_screen.dart)
-[salon_on_map_bloc.dart](lib/bloc/salononmap/salon_on_map_bloc.dart)

## Notes: Don't forget to change your credentials after updating file.
