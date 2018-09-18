#ifndef BACKENDFUNCTIONS_H
#define BACKENDFUNCTIONS_H

#include <QObject>
#include <QProcess>

class BackendFunctions : public QObject
{
    Q_OBJECT

signals:
    void processDone();

private slots:
    void logError();

public:
    BackendFunctions(QString contentPath, QString userPath);

    Q_INVOKABLE void dumpVisitorInfo(QString entry);

    Q_INVOKABLE void launchPresentation();

    Q_INVOKABLE void launchWhiteboard();

private:
    QString loadPathFromFile(QString path);

    QProcess m_process;

    QString m_presentation_path = "mspaint";
    QString m_whiteboard_path = "mspaint";

    QString m_guestbook_path;
};

#endif // BACKENDFUNCTIONS_H
