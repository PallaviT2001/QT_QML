cmake_minimum_required(VERSION 3.16)

project(Project1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appProject1
    main.cpp
)

qt_add_qml_module(appProject1
    URI Project1
    VERSION 1.0
    QML_FILES main.qml
    SOURCES Contact.h Contact.cpp
    SOURCES ContactDataModel.h ContactDataModel.cpp
    SOURCES PhoneBook.h PhoneBook.cpp
    SOURCES CallHistory.h CallHistory.cpp
    SOURCES WhatsApp.h WhatsApp.cpp
    SOURCES ContactModelManager.h ContactModelManager.cpp
    QML_FILES HomePage.qml
    QML_FILES PhoneBookPage.qml
    QML_FILES CallHistoryPage.qml
    QML_FILES WhatsAppList.qml
    QML_FILES AddContactPage.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appProject1 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appProject1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appProject1
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appProject1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
