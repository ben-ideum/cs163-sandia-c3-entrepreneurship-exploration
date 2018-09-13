#include "backendfunctions.h"

#include <QDebug>

BackendFunctions::BackendFunctions() : QObject(0)
{
    QObject::connect(&m_process, SIGNAL(finished(int)), this, SIGNAL(processDone()));
}

void BackendFunctions::dumpVisitorInfo(QString entry)
{
    qDebug() << "dumping entry: " << entry;
}

void BackendFunctions::launchPresentation()
{
    m_process.start("mspaint");
}

void BackendFunctions::launchWhiteboard()
{
    m_process.start("mspaint");
}
