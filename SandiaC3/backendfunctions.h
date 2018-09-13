#ifndef BACKENDFUNCTIONS_H
#define BACKENDFUNCTIONS_H

#include <QObject>
#include <QProcess>

class BackendFunctions : public QObject
{
    Q_OBJECT

signals:
    void processDone();

public:
    BackendFunctions();

    Q_INVOKABLE void dumpVisitorInfo(QString entry);

    Q_INVOKABLE void launchPresentation();

    Q_INVOKABLE void launchWhiteboard();

private:
    QProcess m_process;
};

#endif // BACKENDFUNCTIONS_H
