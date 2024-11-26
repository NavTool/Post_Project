#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QVariantMap>
#include "src/stdafx.h"

struct Person {

    int age;
    bool isStudent;
    bool operator==(const Person& other) const {
        return age == other.age && isStudent == other.isStudent;
    }

    bool operator!=(const Person& other) const {
        return !(*this == other);
    }
};


class DataClass : public QObject
{
    Q_OBJECT

    Q_PROPERTY_AUTO(Person, person)
    Q_PROPERTY_AUTO(int , age)

public:
    explicit DataClass(QObject *parent = nullptr);


signals:


private:
friend class TestClass;

};


class TestClass : public QObject
{
    Q_OBJECT

    Q_PROPERTY_AUTO(Person, person)
    Q_PROPERTY_AUTO(int , age)

public:
    explicit TestClass(QObject *parent = nullptr);


    Q_INVOKABLE int GetAge();


    Q_INVOKABLE bool AddData(DataClass *data);
    Q_INVOKABLE QVariantMap GetData();

signals:


private:


};

#endif // TEST_H
