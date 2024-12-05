#include "Project_Qt.h"

#include <random>



std::shared_ptr<Project_Qt> Project_Qt::getInstance() {
    // 在此处确保 g_project 指向 Project_Qt 类型的实例
    if (!g_project) {
        g_project = std::make_shared<Project_Qt>();
    }

           // 使用 dynamic_pointer_cast 将 g_project 转换为 std::shared_ptr<Project_Qt>
    return std::dynamic_pointer_cast<Project_Qt>(g_project);
}

Project_Qt::Project_Qt(QObject *parent) : QObject{parent}
{

}

Project_Qt::~Project_Qt()
{
}

nlohmann::json Project_Qt::variantToJson(const QVariant &value)
{
    if (value.type() == QVariant::Map) {
        // QVariantMap 转换为 JSON 对象
        QVariantMap map = value.toMap();
        nlohmann::json jsonObj;
        for (auto it = map.begin(); it != map.end(); ++it) {
            jsonObj[it.key().toStdString()] = variantToJson(it.value());
        }
        return jsonObj;
    }
    else if (value.type() == QVariant::List) {
        // QVariantList 转换为 JSON 数组
        QVariantList list = value.toList();
        nlohmann::json jsonArray = nlohmann::json::array();
        for (const auto &item : list) {
            jsonArray.push_back(variantToJson(item));
        }
        return jsonArray;
    }
    else if (value.type() == QVariant::String) {
        // QVariantString 转换为 JSON 字符串
        return value.toString().toStdString();
    }
    else if (value.type() == QVariant::Int) {
        // QVariantInt 转换为 JSON 整数
        return value.toInt();
    }
    else if (value.type() == QVariant::Double) {
        // QVariantDouble 转换为 JSON 浮动
        return value.toDouble();
    }
    else if (value.type() == QVariant::Bool) {
        // QVariantBool 转换为 JSON 布尔值
        return value.toBool();
    }
    else {
        // 默认返回 null
        return nullptr;
    }
}

nlohmann::json Project_Qt::variantMapToJson(const QVariantMap &map)
{
    nlohmann::json jsonObj;
    for (auto it = map.begin(); it != map.end(); ++it) {
        jsonObj[it.key().toStdString()] = variantToJson(it.value());
    }
    return jsonObj;
}

nlohmann::json Project_Qt::variantListToJson(const QList<QVariantMap> &list)
{
    nlohmann::json jsonArray = nlohmann::json::array();
    for (const QVariantMap &map : list) {
        jsonArray.push_back(variantMapToJson(map));
    }
    return jsonArray;
}

nlohmann::json Project_Qt::QStringToJson(const QString &str)
{
    return nlohmann::json(str.toStdString());  // 直接将 QString 转换为 JSON 字符串
}

QVariant Project_Qt::JsonToQVariant(const nlohmann::json &jsonValue)
{
    if (jsonValue.is_object()) {
        // 对象类型，递归转换成 QVariantMap
        return QVariant::fromValue(JsonToQVariantMap(jsonValue));
    } else if (jsonValue.is_array()) {
        // 数组类型，转换为 QList<QVariant>
        return QVariant::fromValue(JsonToQVariantList(jsonValue));
    } else if (jsonValue.is_boolean()) {
        return QVariant(jsonValue.get<bool>());
    } else if (jsonValue.is_number_integer()) {
        return QVariant(jsonValue.get<int>());
    } else if (jsonValue.is_number_float()) {
        return QVariant(jsonValue.get<double>());
    } else if (jsonValue.is_string()) {
        return QVariant(QString::fromStdString(jsonValue.get<std::string>()));
    }
    return QVariant();  // 默认返回空 QVariant
}

QVariantMap Project_Qt::JsonToQVariantMap(const nlohmann::json &jsonObj)
{
    QVariantMap map;
    for (auto it = jsonObj.begin(); it != jsonObj.end(); ++it) {
        map.insert(QString::fromStdString(it.key()), JsonToQVariant(it.value()));
    }
    return map;
}

QList<QVariant> Project_Qt::JsonToQVariantList(const nlohmann::json &jsonArray)
{
    QList<QVariant> list;
    for (const auto& item : jsonArray) {
        list.append(JsonToQVariant(item));
    }
    return list;
}

QString Project_Qt::JsonToQString(const nlohmann::json &json)
{
    return QString::fromStdString(json.get<std::string>());  // 提取 JSON 字符串并转换为 QString
}

bool Project_Qt::Init_Project(QString work_dir, QVariantMap project_info)
{
    return true;
}

bool Project_Qt::Load_Project(QString project_file)
{
    return true;
}

bool Project_Qt::Save_Project(QString project_dir)
{
    return true;
}

bool Project_Qt::Exit_Project()
{
    return true;
}

bool Project_Qt::Project_is_Saved()
{
    return true;
}

bool Project_Qt::Load_History_Project_List()
{
    return true;
}

bool Project_Qt::Save_History_Project_List()
{
    return true;
}

bool Project_Qt::Add_New_Stations(QList<QVariantMap> stationlist)
{
    return true;
}

bool Project_Qt::Load_Nav_Files(QList<QVariantMap> navlist)
{
    return true;
}

bool Project_Qt::Load_Obs_Files(QList<QVariantMap> obslist)
{
    return true;
}

QString Project_Qt::Generate_UniqueKey(int key_length)
{
    std::string new_key;

           // 持续生成新的键直到确保唯一
    do {
        new_key = generate_random_key(key_length);
    } while (_generated_key.find(new_key) != _generated_key.end());

           // 将新生成的键加入已使用集合
    _generated_key.insert(new_key);
    return new_key.c_str();
}

bool Project_Qt::init_unique_generator()
{
    return true;
}

bool Project_Qt::save_unique_generator()
{
    return true;
}

std::string Project_Qt::generate_random_key(int length)
{
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 15);  // 生成十六进制数

           // 获取时间戳和线程ID作为一部分
    auto time_now = std::chrono::steady_clock::now().time_since_epoch().count();
    auto thread_id = std::this_thread::get_id();

    std::ostringstream oss;
    // 使用时间戳和线程ID增加唯一性
    oss << std::hex << time_now << "-" << thread_id;

           // 随机生成附加的16进制字符，增加随机性
    for (size_t i = oss.str().size(); i < length; ++i) {  // 保证生成指定长度的key
        oss << std::hex << dis(gen);
    }
    return oss.str();
}
