QT += quick

CONFIG += c++14

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Comman/backend.cpp \
        Comman/database.cpp \
        Comman/managerpage.cpp \
        Dilekce/dilekcegirispage.cpp \
        Dilekce/dilekceitem.cpp \
        Dilekce/dilekcemanagerpage.cpp \
        Login/puser.cpp \
        TC/tcitem.cpp \
        TC/tcmanagerpage.cpp \
        Talep/talepitem.cpp \
        Talep/talepmanagerpage.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:xml {
    message(Building for Windows)
}

HEADERS += \
    Comman/backend.h \
    Comman/database.h \
    Comman/managerpage.h \
    Dilekce/dilekcegirispage.h \
    Dilekce/dilekceitem.h \
    Dilekce/dilekcemanagerpage.h \
    Login/puser.h \
    TC/tcitem.h \
    TC/tcmanagerpage.h \
    Talep/talepitem.h \
    Talep/talepmanagerpage.h



windows{
    message ("Platform Windows")
    !contains(QMAKE_TARGET.arch, x86_64) {
        msvc{
            message ("Compiler MSVC")

            win32: LIBS += -L$$PWD/../../../../Mongo/msvc2017x86/lib/ -lbsoncxx

            INCLUDEPATH += $$PWD/../../../../Mongo/msvc2017x86/include/bsoncxx/v_noabi
            DEPENDPATH += $$PWD/../../../../Mongo/msvc2017x86/include/bsoncxx/v_noabi


            win32: LIBS += -L$$PWD/../../../../Mongo/msvc2017x86/lib/ -lmongocxx

            INCLUDEPATH += $$PWD/../../../../Mongo/msvc2017x86/include/mongocxx/v_noabi
            DEPENDPATH += $$PWD/../../../../Mongo/msvc2017x86/include/mongocxx/v_noabi



            INCLUDEPATH += $$PWD/../../../../boost/msvcx86/boost_1_71_0
            DEPENDPATH += $$PWD/../../../../boost/msvcx86/boost_1_71_0


            win32: LIBS += -LC:/SerikBLDCoreRelease/MSVC2017X86/lib/ -lSerikBLDCore

            INCLUDEPATH += C:/SerikBLDCoreRelease/MSVC2017X86/include
            DEPENDPATH += C:/SerikBLDCoreRelease/MSVC2017X86/include


#            LIBS += -L$$PWD/SerikBLDCore/lib/ -lSerikBLDCore

#            INCLUDEPATH += $$PWD/SerikBLDCore/include
#            DEPENDPATH += $$PWD/SerikBLDCore/include
        }
    }
}



DISTFILES +=












