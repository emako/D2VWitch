#-------------------------------------------------
#
# Project created by QtCreator 2018-12-23T00:15:32
#
#-------------------------------------------------

QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += no_batch

CONFIG += c++11
TEMPLATE = app
DEFINES += QT_DEPRECATED_WARNINGS

PROJECT_DIRECTORY = $$PWD
COMMON_DIRECTORY = $$PWD

ARCHITECTURE_64_BIT = true

MOC_DIR = $${PROJECT_DIRECTORY}/generated/moc
UI_DIR = $${PROJECT_DIRECTORY}/generated/ui
RCC_DIR = $${PROJECT_DIRECTORY}/generated/rcc

RC_ICONS = $${COMMON_DIRECTORY}/res/icons/d2vwitch.ico

FFMPEG_LIB = $${PROJECT_DIRECTORY}/ffmpeg/lib
FFMPEG_HEADER = $${PROJECT_DIRECTORY}/ffmpeg/include

INCLUDEPATH += $${PROJECT_DIRECTORY}/vapoursynth
INCLUDEPATH += $${FFMPEG_HEADER}

CONFIG(debug, debug|release) {

    contains(QMAKE_COMPILER, gcc) {
        if($$ARCHITECTURE_64_BIT) {
            DESTDIR = $${COMMON_DIRECTORY}/build/debug-64bit-gcc
            TARGET = d2vwitch-debug-64bit-gcc
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-debug-64bit-gcc
        } else {
            DESTDIR = $${COMMON_DIRECTORY}/build/debug-32bit-gcc
            TARGET = d2vwitch-debug-32bit-gcc
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-debug-32bit-gcc
        }

        QMAKE_CXXFLAGS += -O0
        QMAKE_CXXFLAGS += -g
        QMAKE_CXXFLAGS += -ggdb3
    }

    contains(QMAKE_COMPILER, msvc) {
        if($$ARCHITECTURE_64_BIT) {
            DESTDIR = $${COMMON_DIRECTORY}/build/debug-64bit-msvc
            TARGET = d2vwitch-debug-64bit-msvc
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-debug-64bit-msvc
        } else {
            DESTDIR = $${COMMON_DIRECTORY}/build/debug-32bit-msvc
            TARGET = d2vwitch-debug-32bit-msvc
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-debug-32bit-msvc
        }
    }

} else {

    contains(QMAKE_COMPILER, gcc) {
        if($$ARCHITECTURE_64_BIT) {
            DESTDIR = $${COMMON_DIRECTORY}/build/release-64bit-gcc
            TARGET = d2vwitch
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-release-64bit-gcc
        } else {
            DESTDIR = $${COMMON_DIRECTORY}/build/release-32bit-gcc
            TARGET = d2vwitch-32bit
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-release-32bit-gcc
        }

        QMAKE_CXXFLAGS += -O2
        QMAKE_CXXFLAGS += -fexpensive-optimizations
        QMAKE_CXXFLAGS += -funit-at-a-time
    }

    contains(QMAKE_COMPILER, msvc) {
        if($$ARCHITECTURE_64_BIT) {
            DESTDIR = $${COMMON_DIRECTORY}/build/release-64bit-msvc
            TARGET = d2vwitch
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-release-64bit-msvc
        } else {
            DESTDIR = $${COMMON_DIRECTORY}/build/release-32bit-msvc
            TARGET = d2vwitch-32bit
            OBJECTS_DIR = $${PROJECT_DIRECTORY}/generated/obj-release-32bit-msvc
        }
    }

    DEFINES += NDEBUG
}

LIBS += -L$${FFMPEG_LIB} -lavcodec
LIBS += -L$${FFMPEG_LIB} -lavdevice
LIBS += -L$${FFMPEG_LIB} -lavfilter
LIBS += -L$${FFMPEG_LIB} -lavformat
LIBS += -L$${FFMPEG_LIB} -lavutil
LIBS += -L$${FFMPEG_LIB} -lpostproc
LIBS += -L$${FFMPEG_LIB} -lswresample
LIBS += -L$${FFMPEG_LIB} -lswscale

S = $${DIR_SEPARATOR}

D = $$DESTDIR
D = $$replace(D, $$escape_expand(\\), $$S)
D = $$replace(D, /, $$S)

E = $$escape_expand(\n\t)

win32 {
    QT += winextras

    DEPLOY_COMMAND = windeployqt
    DEPLOY_TARGET = $$shell_quote($$shell_path($${D}/$${TARGET}.exe))
    QMAKE_POST_LINK += $${DEPLOY_COMMAND} --no-translations $${DEPLOY_TARGET} $${E}

    if($$ARCHITECTURE_64_BIT) {
        message("x86_64 build")
    } else {
        message("x86 build")
        contains(QMAKE_COMPILER, gcc) {
                QMAKE_LFLAGS += -Wl,--large-address-aware
        }
        contains(QMAKE_COMPILER, msvc) {
                QMAKE_LFLAGS += /LARGEADDRESSAWARE
        }
    }
}

HEADERS += \
    Audio.h \
    Bullshit.h \
    D2V.h \
    FakeFile.h \
    FFMPEG.h \
    GUIWindow.h \
    ListWidget.h \
    MPEGParser.h \
    ScrollArea.h \
    version.h

SOURCES += \
    Audio.cpp \
    Bullshit.cpp \
    D2V.cpp \
    D2VWitch.cpp \
    FakeFile.cpp \
    FFMPEG.cpp \
    GUIWindow.cpp \
    ListWidget.cpp \
    MPEGParser.cpp \
    ScrollArea.cpp

RESOURCES += \
    res/res.qrc

