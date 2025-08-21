cmake_minimum_required(VERSION 3.16)

project(Abstract_list_view_model VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_add_executable(appAbstract_list_view_model
    main.cpp
)

qt_add_qml_module(appAbstract_list_view_model
    URI Abstract_list_view_model
    VERSION 1.0
    QML_FILES main.qml
    SOURCES Phonebook.h Phonebook.cpp
    SOURCES ContactModel.h ContactModel.cpp
    QML_FILES ShowList.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appAbstract_list_view_model PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appAbstract_list_view_model
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAbstract_list_view_model
    PRIVATE Qt6::Quick)
target_link_libraries(appAbstract_list_view_model PRIVATE Qt6::Core)
target_link_libraries(appAbstract_list_view_model PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appAbstract_list_view_model
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
