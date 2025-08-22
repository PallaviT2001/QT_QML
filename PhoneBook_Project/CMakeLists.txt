cmake_minimum_required(VERSION 3.16)

project(PhoneBook_Project VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_add_executable(appPhoneBook_Project
    main.cpp
)

qt_add_qml_module(appPhoneBook_Project
    URI PhoneBook_Project
    VERSION 1.0
    QML_FILES main.qml
    SOURCES PhoneBook.h PhoneBook.cpp
    SOURCES ContactModel.h ContactModel.cpp
    QML_FILES Contacts.qml
    QML_FILES ContactListDisplay.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPhoneBook_Project PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPhoneBook_Project
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPhoneBook_Project
    PRIVATE Qt6::Quick)
target_link_libraries(appPhoneBook_Project PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appPhoneBook_Project
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
