cmake_minimum_required(VERSION 3.16)

project(login VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick Core REQUIRED)

qt_add_executable(applogin
    main.cpp
)

qt_add_qml_module(applogin
    URI login
    VERSION 1.0
    QML_FILES
        main.qml
        HomePage.qml
        LoginPage.qml
        RegisterPage.qml
        StudentShowModel.qml
    SOURCES
        Student.h Student.cpp
        StudentManager.h StudentManager.cpp
)

set_target_properties(applogin PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

target_link_libraries(applogin
    PRIVATE Qt6::Quick Qt6::Core
)

include(GNUInstallDirs)
install(TARGETS applogin
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
