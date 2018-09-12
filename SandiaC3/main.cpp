#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QStandardPaths>

#include <QDebug>
#include <QVariantList>
#include <QDir>

#include <QtWebEngine/QtWebEngine>

QVariantList parseEvents(QString path) {
    QVariantList events;
    path += "events.tsv";
    if (!QFileInfo::exists(path)) {
        qDebug() << "INFO: Couldn't find file " << path;
        return events;
    }
    QFile file(path);
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&file);
        QString line = stream.readLine();
        while (!stream.atEnd()) {
            line = stream.readLine();
            QStringList entries = line.split("\t");
            if (entries.length() < 8) {
                qDebug() << "WARNING: not enough entries for line...";
                qDebug() << "         "+line;
                continue;
            }
            QVariantMap map;
            map["date"]        = entries[0];
            map["time"]        = entries[1];
            map["title"]       = entries[2];
//            qDebug() << "INFO: Added event " << entries[2];
            map["description"] = entries[3];
            map["image"]       = entries[4];
            map["location"]    = entries[5];
            map["address_1"]   = entries[6];
            map["address_2"]   = entries[7];
            events << map;
        }
    } else {
        qDebug() << "WARNING: Could not open file " << path;
    }
    return events;
}

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QString desktopPath = QStandardPaths::locate(QStandardPaths::DesktopLocation, QString(), QStandardPaths::LocateDirectory);

    QQmlApplicationEngine engine;
    QtWebEngine::initialize();

    engine.rootContext()->setContextProperty("eventList", parseEvents(desktopPath+"/content/"));
    engine.rootContext()->setContextProperty("contentPath", "file:///"+desktopPath+"/content/");

    engine.load(QUrl(QStringLiteral("qrc:/Qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
