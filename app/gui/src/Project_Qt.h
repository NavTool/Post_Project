#pragma once

#include <QObject>
#include <QtQml/qqml.h>
#include "stdafx.h"
#include "Project.h"
#include <set>


//Qt类，继承所有的CPP的方法，调用CPP的方法
class Project_Qt: public QObject,public Project_CPP
{
private:
    Q_OBJECT
    //QML_SINGLETON   //因为需要返回唯一实例，让基类和此派生类都能使用，因此，不能直接用QML的单例宏定义来实现注册到QML中，而是需要在主函数中手动注册
    QML_ELEMENT
public:
    static std::shared_ptr<Project_Qt> getInstance();//返回唯一实例，这个实例和基类是一个实例，因此必须先于基类的getInstance()调用

    explicit Project_Qt(QObject *parent = nullptr);
    ~Project_Qt();

    inline  nlohmann::json variantToJson(const QVariant &value);
    inline  nlohmann::json variantMapToJson(const QVariantMap &map);
    inline  nlohmann::json variantListToJson(const QList<QVariantMap> &list);
    inline  nlohmann::json QStringToJson(const QString& str) ;

    inline  QVariant JsonToQVariant(const nlohmann::json& jsonValue) ;
    inline  QVariantMap JsonToQVariantMap(const nlohmann::json& jsonObj);
    inline  QList<QVariant> JsonToQVariantList(const nlohmann::json& jsonArray);
    inline  QString JsonToQString(const nlohmann::json& json);

public:
    //------------------------------创建、打开、保持工程相关操作及属性---------------------------------
    Q_PROPERTY_AUTO (QVariantMap,project_info)      //工程信息/属性
    Q_PROPERTY_READONLY_AUTO(QString, project_dir)  //工程保存路径

           //创建工程，在指定的dir，写入工程信息
    Q_INVOKABLE bool Init_Project(QString work_dir,QVariantMap project_info);

           //载入工程，读取指定文件信息，根据信息，读取数据等内容
    Q_INVOKABLE bool Load_Project(QString project_file);

           //保存工程，保存到指定的路径下，如果为空，那就是当前路径
    Q_INVOKABLE bool Save_Project(QString project_dir="");

           //关闭工程
    Q_INVOKABLE bool Exit_Project();

           //工程是否已经保存
    Q_INVOKABLE bool Project_is_Saved();


public:
        //-------------------------------------历史工程---------------------------------
    Q_PROPERTY_AUTO(QList<QVariantMap>, project_list) //历史打开的工程信息 （工程名,工程路径，最后修改时间）

           //打开历史信息记录文件（）
    Q_INVOKABLE bool Load_History_Project_List();

           //保存历史信息记录文件（）
    Q_INVOKABLE bool Save_History_Project_List();


public:
        //--------------------------------数据集-------------------------------------------

    Q_PROPERTY_AUTO(QList<QVariantMap>, relation_db)
    Q_PROPERTY_AUTO(QList<QVariantMap>, baseline_map)
    Q_PROPERTY_AUTO(QList<QVariantMap>, result_map)
    Q_PROPERTY_AUTO(QList<QVariantMap>, task_map)


public:
    //-----------------------------------站点------------------------------------------------

    Q_PROPERTY_AUTO(QList<QVariantMap>, station_map)

           //批量创建新的站点  (站点名称，站点类型，站点坐标（可选输入）
    Q_INVOKABLE bool Add_New_Stations(QList<QVariantMap> stationlist);


public:
    //-----------------------------------文件------------------------------------------

    Q_PROPERTY_AUTO(QList<QVariantMap>, obsfile_map)

           //批量导入广播星历,广播星历导入后，皆为全局可用
    Q_INVOKABLE bool Load_Nav_Files(QList<QVariantMap> navlist);

           //批量导入obs观测文件，同时也会导入广播星历，如果是归属于新站点，那么也会创建站点
    Q_INVOKABLE bool Load_Obs_Files(QList<QVariantMap> obslist);


public:
    //-------------随机键值生成器，用于给每个文件、测站、基线、结果生成唯一的key值-------------------
    Q_INVOKABLE QString Generate_UniqueKey(int key_length=4);
private:
    bool init_unique_generator();//从文件中读取已经生成的键值，保证唯一性
    bool save_unique_generator();//将键值保存到文件中
    std::string generate_random_key(int length);
    std::set<std::string> _generated_key;   //已经生成过的唯一key值






};
