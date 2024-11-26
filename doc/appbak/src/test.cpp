#include "test.h"

DataClass::DataClass(QObject *parent)
    : QObject{parent}
{}

TestClass::TestClass(QObject *parent)
    : QObject{parent}
{}

int TestClass::GetAge()
{
    return _age;
}

bool TestClass::AddData(DataClass *data)
{
    _age=  data->_age;

    return true;
}

QVariantMap TestClass::GetData()
{
    QVariantMap map;
    map["age"] = _age;
    map["ok"] = true;
    return map;
}


