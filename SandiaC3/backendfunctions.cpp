#include "backendfunctions.h"

#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QDate>
#include <QFileInfo>
#include <QDir>

void BackendFunctions::logError()
{
    qDebug() << "INFO: Process failed with error " << m_process.errorString();
}

BackendFunctions::BackendFunctions(QString contentPath) : QObject(0)
{
    QObject::connect(&m_process, SIGNAL(finished(int)), this, SIGNAL(processDone()));
    QObject::connect(&m_process, SIGNAL(error(QProcess::ProcessError)), this, SIGNAL(processDone()));
    QObject::connect(&m_process, SIGNAL(error(QProcess::ProcessError)), this, SLOT(logError()));

    m_presentation_path = loadPathFromFile(contentPath+"/paths/presentation.txt");
    m_whiteboard_path = loadPathFromFile(contentPath+"/paths/whiteboard.txt");

    m_guestbook_path = contentPath + "/signin/";
    QDir dir(contentPath);
    dir.mkpath("signin");
}

void BackendFunctions::dumpVisitorInfo(QString entry)
{
    QString filename = QDate::currentDate().toString("yyyy-MMMM");
    filename += "-guesbook.tsv";

    QFile file(m_guestbook_path + filename);
    if (file.open(QIODevice::WriteOnly | QIODevice::Append)) {
        QTextStream stream(&file);
        stream << entry;
        qDebug() << "INFO: dumped entry " << entry;
        file.close();
    } else {
        qDebug() << "ERROR: Could not open file " << filename;
        qDebug() << "       "+file.errorString();
    }

}

void BackendFunctions::launchPresentation()
{
    m_process.start("\""+m_presentation_path+"\"");
}

void BackendFunctions::launchWhiteboard()
{
    m_process.start("\""+m_whiteboard_path+"\"");
}

QString BackendFunctions::loadPathFromFile(QString path)
{
    QString val = "mspaint";

    QFile file(path);
    if (file.open(QIODevice::ReadOnly)) {
        QTextStream stream(&file);
        val = stream.readLine();
        file.close();
        qDebug() << "INFO: Read program path" << val;
    } else {
        qDebug() << "ERROR: Problem opening file " << path;
        qDebug() << "       "+file.errorString();
    }

    return val;
}
