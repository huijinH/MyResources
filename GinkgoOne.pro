#-------------------------------------------------
#
# Project created by QtCreator 2019-07-26T09:07:26
#
#-------------------------------------------------

QT       += core gui webenginewidgets webchannel

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app

#如果编译中文GinkgoOne，就注释下面这行；如果编译英文GinkgoOne，就打开下面注释
DEFINES += LANG_EN

DEFINES += QT_DEPRECATED_WARNINGS

if (contains(DEFINES, LANG_EN)) {
    TARGET = GinkgoOne_En
} else {
    TARGET = GinkgoOne
}

RC_ICONS = GinkgoOne.ico

win32: LIBS += -lSetupAPI

win32: LIBS += -lAdvAPI32


LIBS += -lshell32
LIBS += -luser32

contains(QT_ARCH, i386) {
    CONFIG(debug, debug|release){
        LIBS += -L./Lib/32bit -lqscintilla2_qt5d -lGinkgo_Driver -lucrtd
    } else {
        LIBS += -L./Lib/32bit -lqscintilla2_qt5 -lGinkgo_Driver -lucrt
    }
    DESTDIR = ./32bit_bin
} else {
    CONFIG(debug, debug|release){
        LIBS += -L./Lib/64bit -lqscintilla2_qt5d -lGinkgo_Driver -lucrtd
    } else {
        LIBS += -L./Lib/64bit -lqscintilla2_qt5 -lGinkgo_Driver -lucrt
    }
    DESTDIR = ./64bit_bin
}

INCLUDEPATH += ./Source

SOURCES += \
    Source/main.cpp \
    Source/widget.cpp \
    Source/workthread.cpp



HEADERS += \
    Source/ErrorType.h \
    Source/type.h \
    Source/widget.h \
    Source/workthread.h \
    Source/BL_Driver.h \
    Source/cmd_id.h \
    Source/vt_msg.h \
    Source/filedef.h




FORMS +=