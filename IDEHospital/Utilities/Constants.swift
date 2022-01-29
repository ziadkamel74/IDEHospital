//
//  Constants.swift
//  IDEHospital
//
//  Created by Ziad on 07/12/2020.
//

import Foundation

// Storyboards
struct Storyboards {
    static let serviceSearch = "ServiceSearch"
    static let home = "Home"
    static let homeNurse = "HomeNurseContactUs"
    static let searchResults = "SearchResults"
    static let myFavorites = "MyFavorites"
    static let myAppointments = "MyAppointments"
    static let aboutAndTerms = "AboutAndTerms"
    static let authentication = "Authentication"
    static let setting = "Setting"
    static let review = "Review"
    static let voucherPopUp = "VoucherPopUp"
    static let confirmAppointmentPopUp = "ConfirmAppointmentPopUp"
    static let yesOrNoPopUp = "YesOrNoPopUp"
    static let successOrFailurePopUp = "SuccessOrFailurePopUp"
    static let unAuthPopUp = "UnAuthenticatedPopUp"
    static let doctorProfile = "DoctorProfile"
    static let editProfile = "EditProfile"
}

// ViewControllers
struct ViewControllers {
    static let serviceSearchVC = "ServiceSearchVC"
    static let homeVC = "HomeVC"
    static let homeNurseContactUsVC = "HomeNurseContactUsVC"
    static let searchResultsVC = "SearchResultsVC"
    static let myFavoritesVC = "MyFavoritesVC"
    static let myAppointmentsVC = "MyAppointmentsVC"
    static let aboutAndTerms = "AboutAndTermsVC"
    static let loginVC = "LoginVC"
    static let signupVC = "SignupVC"
    static let resetPasswordVC = "ResetPasswordVC"
    static let settingVC = "SettingVC"
    static let reviewVC = "ReviewVC"
    static let voucherPopUpVC = "VoucherPopUpVC"
    static let confirmAppointmentPopUpVC = "ConfirmAppointmentPopUpVC"
    static let yesOrNoPopUpVC = "YesOrNoPopUpVC"
    static let successOrFailurePopUpVC = "SuccessOrFailurePopUpVC"
    static let unAuthPopUpVC = "UnAuthenticatedPopUpVC"
    static let doctorProfileVC = "DoctorProfileVC"
    static let editProfileVC = "EditProfileVC"
}

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "UDKToken"
}

// Urls
struct URLs {
    static let base = "http://ide-hospital.ideaeg.co/api"
    static let mainCategories = "/main_categories"
    static let nurseRequset = "/nursing_requests"
    static let contactRequest = "/contact_us_requests"
    static let favorites = "/favorites/doctors"
    static let appointments = "/user_appointments"
    static let aboutUs = "/about_us"
    static let terms = "/terms_and_conditions"
    static let register = "/register"
    static let login = "/login"
    static let forgetPassword = "/forget_password"
    static let logout = "/logout"
    static let addReview = "/doctors"
    static let bookAppointment = "/user_appointments"
    static let doctor = "/doctors"
    static let review = "/reviews"
    static let doctorAppointments = "/appointments"
    static let loginAndBook = "/user_appointments/with_login"
    static let registerAndBook = "user_appointments/with_register"
    static let user = "/user"
}

// HeaderKeys
struct HeaderKeys {
    static let accept = "Content-Type"
    static let acceptLanguage = "Accept-Language"
    static let authorization = "Authorization"
}

// HeaderValues
struct HeaderValues {
    static let appJSON = "application/json"
    static let en = "en"
}

// Parameters Keys
struct ParameterKeys {
    static let name = "name"
    static let email = "email"
    static let mobile = "mobile"
    static let message = "message"
    static let mainCategoryId = "main_category_id"
    static let page = "page"
    static let specialtyId = "specialty_id"
    static let cityId = "city_id"
    static let regionId = "region_id"
    static let companyId = "company_id"
    static let orderBy = "order_by"
    static let rating = "rating"
    static let comment = "comment"
}

// Cells
struct Cells {
    static let categoryCell = "CategoryCell"
    static let searchResultsCell = "SearchResultsCell"
    static let myFavoriteCell = "MyFavoriteCell"
    static let myAppointmentCell = "MyAppointmentCell"
    static let settingCell = "SettingCell"
    static let timeCell = "TimeCell"
    static let reviewCell = "ReviewCell"
}
