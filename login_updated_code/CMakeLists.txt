cmake_minimum_required(VERSION 3.16)

project(login_updated_code VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_add_executable(applogin_updated_code
    main.cpp
)

qt_add_qml_module(applogin_updated_code
    URI login_updated_code
    VERSION 1.0
    QML_FILES main.qml
    SOURCES Student.h Student.cpp
    QML_FILES HomePage.qml
    QML_FILES RegisterPage.qml
    QML_FILES LoginPage.qml
    SOURCES Studentdetails.h Studentdetails.cpp
    SOURCES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(applogin_updated_code PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.applogin_updated_code
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(applogin_updated_code
    PRIVATE Qt6::Quick)
target_link_libraries(applogin_updated_code PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS applogin_updated_code
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
