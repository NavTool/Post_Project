#include <QObject>
#include <QVariantList>
#include <QtSerialPort/QSerialPort>
#include <QtSerialPort/QSerialPortInfo>
#include "src/stdafx.h"

class Nav_Serial_Port : public QObject
{
    Q_OBJECT

    // Q_PROPERTY_AUTO(QVariant, port_list)          //串口列表

    Q_PROPERTY_AUTO(QString, port_name) // 串口名
    Q_PROPERTY_AUTO(int, baud_rate)     // 波特率
    Q_PROPERTY_AUTO(int, baud_stop)     // 停止位
    Q_PROPERTY_AUTO(int, data_bits)     // 数据位
    Q_PROPERTY_AUTO(int, data_parity)   // 校验位

    Q_PROPERTY_READONLY_AUTO(bool, isConnected) // 连接状态
    Q_PROPERTY_READONLY_AUTO(int, sendbyte)     // 发送字节
    Q_PROPERTY_READONLY_AUTO(int, recvbyte)     // 接收字节

    Q_PROPERTY_READONLY_AUTO(QString, recvbuffer)   // 接收缓冲区
    Q_PROPERTY_AUTO(QString, sendbuffer)            // 发送缓冲区

    Q_PROPERTY_AUTO(bool, recvHexString)     // 16进制接收
    Q_PROPERTY_AUTO(bool, sendHexString)     // 16进制发送

public:
    Nav_Serial_Port(QObject *parent = nullptr);

    // 更新可用串口列表
    Q_INVOKABLE QVariantList getAvailableSerialPort();
    Q_INVOKABLE bool connectSerialPort();
    Q_INVOKABLE bool disconnectSerialPort();
    Q_INVOKABLE void sendSerialData(const QString &data);

signals:
    void recvNewBuffer(const QString &data);
private slots:
    void onDataReceived();
private:
    QSerialPort *_serialPort;
};
