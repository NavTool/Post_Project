#include"Nav_Serial_Port.h"
#include <QVariant>

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

    recvbuffer();
    sendbuffer();

    recvHexString(false);
    sendHexString(false);
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
        connect(_serialPort, &QSerialPort::readyRead, this, &Nav_Serial_Port::onDataReceived);
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

    emit recvNewBuffer(recv);
    emit recvbufferChanged();
    recvbyte(_recvbyte+=recv.size());
}

void Nav_Serial_Port::sendSerialData(const QString &data)
{
    if(_serialPort==nullptr)
    {
        return;
    }

    sendbyte(_sendbyte+=data.size());
    _serialPort->write(data.toStdString().c_str());

}

