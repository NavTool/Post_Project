#include"Nav_Serial_Port.h"
#include <QVariant>
#include <qdir.h>
// #include <winsock.h>

Nav_Serial_Port::Nav_Serial_Port(QObject *parent)
    : QObject{parent}
{
    port_name();
    baud_rate(0);
    baud_stop(0);
    data_bits(0);
    data_parity(0);

    isConnected(false);
    sendbyte(0);
    recvbyte(0);

    // recvbuffer();
    // sendbuffer();

    recvHexString(false);
    sendHexString(false);
    sendNewLine(false);
    autoSaveDate(false);

    connect(this, &Nav_Serial_Port::autoSaveDateChanged, this, &Nav_Serial_Port::onChangeAutoSave);
}

QVariantList  Nav_Serial_Port::getAvailableSerialPort()
{
    QVariantList portLists;
    foreach(const QSerialPortInfo &info, QSerialPortInfo::availablePorts()) {

        QVariantMap portItem;
        portItem["portname"]= info.portName();
        portItem["description"]=  info.description();
        portItem["manufacturer"]=info.manufacturer();
        portItem["systemLocation"]=info.systemLocation();
        portLists<<portItem;
    }
    return portLists;
}

bool Nav_Serial_Port::connectSerialPort()
{
    _serialPort=new QSerialPort(this);

    connect(_serialPort, &QSerialPort::readyRead, this, &Nav_Serial_Port::onDataReceived);
    connect(_serialPort, &QSerialPort::errorOccurred, this, &Nav_Serial_Port::onSerialPortError);


    _serialPort->setPortName(_port_name);
    _serialPort->setBaudRate(_baud_rate);

    switch (_data_bits) {
    case 0:
        _serialPort->setDataBits(QSerialPort::Data8);
        break;
    case 1:
        _serialPort->setDataBits(QSerialPort::Data7);
        break;
    case 2:
        _serialPort->setDataBits(QSerialPort::Data6);
        break;
    case 3:
        _serialPort->setDataBits(QSerialPort::Data5);
        break;
    default:
        return false;
        break;
    }

    switch (_data_parity) {
    case 0:
        _serialPort->setParity(QSerialPort::NoParity);
        break;
    case 1:
        _serialPort->setParity(QSerialPort::OddParity);
        break;
    case 2:
        _serialPort->setParity(QSerialPort::EvenParity);
        break;
    default:
        return false;
        break;
    }

    switch (_baud_stop) {
    case 0:
        _serialPort->setStopBits(QSerialPort::OneStop);
        break;
    case 1:
        _serialPort->setStopBits(QSerialPort::OneAndHalfStop);
        break;
    case 2:
        _serialPort->setStopBits(QSerialPort::TwoStop);
        break;
    default:
        return false;
        break;
    }

    _serialPort->setFlowControl(QSerialPort::NoFlowControl);

    if(_serialPort->open(QIODevice::ReadWrite))
    {
        isConnected(true);
        return true;
    }
    else
    {
        return false;
    }

}

bool Nav_Serial_Port::disconnectSerialPort()
{
    if(_serialPort==nullptr)
    {
        return false;
    }

    _serialPort->close();

    delete _serialPort;
    _serialPort=nullptr;
    isConnected(false);
    return true;
}


void Nav_Serial_Port::onDataReceived()
{
    auto recv= _serialPort->readAll();
    _recvbuffer.append(recv);


    if(_autoSaveDate && _savefile)
    {
        QTextStream out(_savefile);
        out << recv;
    }

    emit recvNewBuffer(recv);
    // emit recvbufferChanged();
    recvbyte(_recvbyte+=recv.size());
}

void Nav_Serial_Port::onSerialPortError(QSerialPort::SerialPortError error)
{
    if (error == QSerialPort::NoError)
        return;

    // 根据不同的错误类型进行处理
    switch (error) {
    case QSerialPort::NoError:
        // 没有错误，不需要处理
        break;
    case QSerialPort::DeviceNotFoundError:
        qDebug() << "Error: Device not found";
        emit recvSerialError(error,"Error: Device not found");
        break;
    case QSerialPort::PermissionError:
        qDebug() << "Error: Permission denied";
        emit recvSerialError(error,"Error: Permission denied");
        break;
    case QSerialPort::OpenError:
        qDebug() << "Error: Open failed";
        emit recvSerialError(error,"Error: Open faile");
        break;
    case QSerialPort::WriteError:
        qDebug() << "Error: Write";
        emit recvSerialError(error,"Error: Write");
        break;
    case QSerialPort::ReadError:
        qDebug() << "Error: Read";
        emit recvSerialError(error,"Error: Read");
        break;
    case QSerialPort::ResourceError:
        qDebug() << "Error: Resource";
        emit recvSerialError(error,"Error: Resource");
        break;
    case QSerialPort::UnsupportedOperationError:
        qDebug() << "Error: Unsupported operation";
        emit recvSerialError(error,"Error: Unsupported operation");
        break;
    case QSerialPort::UnknownError:
        qDebug() << "Error: Unknown";
        emit recvSerialError(error,"Error: Unknown");
        break;
    case QSerialPort::TimeoutError:
        qDebug() << "Error: Timeout";
        emit recvSerialError(error,"Error: Timeout");
        break;
    case QSerialPort::NotOpenError:
        qDebug() << "Error: Not open";
        emit recvSerialError(error,"Error: Not open");
        break;
    default:
        qDebug() << "Error: Unexpected error";
        emit recvSerialError(error,"Error: Unexpected error");
        break;
    }
}

void Nav_Serial_Port::onChangeAutoSave()
{
    if(_autoSaveDate)
    {
        QString fileName = QDateTime::currentDateTime().toString("yyyyMMdd_HHmmss") + "_AutoSave.txt";
        _savefile = new QFile(fileName);
        if (!_savefile->open(QIODevice::WriteOnly | QIODevice::Text)) {
            qWarning() << "Failed to open file:" << fileName;
            delete _savefile;
            _savefile = nullptr;
            emit recvSerialInfo(3,"Create Auto Save File Failed!");
            autoSaveDate(false);
        }
        emit recvSerialInfo(0,"Save Date to :"+fileName);
    }
    else
    {
        if (_savefile) {
            _savefile->close();
            delete _savefile;
            _savefile = nullptr;

            emit recvSerialInfo(0,"Close Auto Save");
        }
    }
}

void Nav_Serial_Port::sendSerialData(const QString &data)
{
    if(_serialPort==nullptr)
    {
        return;
    }

    sendbyte(_sendbyte+=data.size());
    _serialPort->write(data.toStdString().c_str());
    if(_sendNewLine){
        _serialPort->write("\r\n");
        // #if defined(Q_OS_WIN)
        //         _serialPort->write("\r\n"); // Windows: CRLF
        // #else
        //         _serialPort->write("\n"); // Linux/Unix: LF
        // #endif
    }
}

bool Nav_Serial_Port::saveDataToFile(const QString &filepath, const QString &data)
{
    QFile savefile(filepath);

    if (!savefile.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file:" << filepath;

        emit recvSerialInfo(3,"Create Save File Failed!");
        return false;
    }

    QTextStream out(&savefile);
    out << data;

    savefile.close();

    emit recvSerialInfo(0,"Save Path:"+ filepath);

    return true;
}

bool Nav_Serial_Port::saveRecvToFile(const QString &filepath)
{
    QFile savefile(filepath);

    if (!savefile.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file:" << filepath;

        emit recvSerialInfo(3,"Create Save File Failed!");
        return false;
    }

    QTextStream out(&savefile);
    out << _recvbuffer;
    savefile.close();

    emit recvSerialInfo(0,"Save Path:"+ filepath);

    return true;
}

bool Nav_Serial_Port::clearRecvBuffer()
{
    _recvbuffer.clear();
    recvbyte(_recvbuffer.size());
    sendbyte(0);
    return true;
}

