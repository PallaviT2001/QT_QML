cmake_minimum_required(VERSION 3.16)

project(PhoneBook_Project_with_files VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_add_executable(appPhoneBook_Project_with_files
    main.cpp
)

qt_add_qml_module(appPhoneBook_Project_with_files
    URI PhoneBook_Project_with_files
    VERSION 1.0
    QML_FILES main.qml
    SOURCES CallHistory.h CallHistory.cpp
    SOURCES Contact.h Contact.cpp
    SOURCES ContactDataModel.h ContactDataModel.cpp
    SOURCES
    SOURCES PhoneBook.h PhoneBook.cpp
    SOURCES WhatsApp.h WhatsApp.cpp
    QML_FILES PhoneBookPage.qml
    QML_FILES CallHistoryPage.qml
    QML_FILES WhatsAppList.qml
    QML_FILES AddContactPage.qml
    QML_FILES
    QML_FILES HomePage.qml
    SOURCES CsvLoader.h CsvLoader.cpp
    SOURCES ContactModelManager.h ContactModelManager.cpp
    RESOURCES test.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPhoneBook_Project_with_files PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPhoneBook_Project_with_files
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPhoneBook_Project_with_files
    PRIVATE Qt6::Quick)
target_link_libraries(appPhoneBook_Project_with_files PRIVATE Qt6::Core)
target_link_libraries(appPhoneBook_Project_with_files PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appPhoneBook_Project_with_files
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
