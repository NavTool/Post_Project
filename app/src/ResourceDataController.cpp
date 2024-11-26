#include "ResourceDataController.h"

#include <QThreadPool>

ResourceDataController::ResourceDataController(QObject *parent) : QObject{parent} {
}

QList<QVariantMap> ResourceDataController::dig(const QString &path, int level) {
    QList<QVariantMap> list;
    // for (int i = 0; i < 5; ++i) {
    //     QString key = path + "-" + QString::number(i);
    //     // auto rowData = generateRowData();
    //     rowData.insert("key", key);
    //     if (level > 0) {
    //         rowData.insert("children", QVariant::fromValue(dig(key, level - 1)));
    //     }
    //     list.append(rowData);
    // }
    return list;
}

void ResourceDataController::loadData(const QString &path, int level) {
    QThreadPool::globalInstance()->start([=]() {
        Q_EMIT loadDataStart();
        // m_data.clear();
        // m_data = dig(path, level);

        m_station_data.clear();
        m_obsfile_data.clear();
        m_baseline_data.clear();

        for(const auto &iter:m_station)
        {
            m_station_data.append(generateStationData(iter));
            m_obsfile_data.append(generateObsFileData(iter));

            for(const auto &iter2:m_station)
            {
                if(iter!=iter2)
                {
                    m_baseline_data.append(generateBaselineData(iter,iter2));
                }
            }
        }

        Q_EMIT loadDataSuccess();
    });
}

QVariantMap ResourceDataController::generateStationData(const QString &station_name)
{
    return {
        {"station_name",station_name},
        {"utm_n", (QRandomGenerator::global()->bounded(340000000, 350000000)/100.0)},
        {"utm_e", QRandomGenerator::global()->bounded(500000000, 600000000)/1000.0},
        {"utm_u", QRandomGenerator::global()->bounded(500000, 2000000)/10000.0},
        {"llh_lat", QRandomGenerator::global()->bounded(300000000, 320000000)/10000000.0},
        {"llh_lon", QRandomGenerator::global()->bounded(1120000000, 1140000000)/10000000.0},
        {"llh_height", QRandomGenerator::global()->bounded(800000, 2000000)/10000.0},
        {"ecef_x", -(QRandomGenerator::global()->bounded(200000000, 220000000)/100.0)},
        {"ecef_y", QRandomGenerator::global()->bounded(503000000, 507000000)/100.0},
        {"ecef_z", QRandomGenerator::global()->bounded(320000000, 340000000)/100.0},
        // {"height", 30},
        // {"minimumHeight", 25},
        // {"maximumHeight", 240}
        };
}

QVariantMap ResourceDataController::generateObsFileData(const QString &station_name)
{
    return {
        {"file_name",station_name+"202410300000.24O"},
        {"file_type",tr("static")},
        {"station_name",station_name},
        {"file_start_time",1698614400},
        {"file_end_time",1698614400},
        {"file_time_span",86399},//持续时间：终止时间减去起始时间file_end_time-file_start_time
        {"measurement_method",tr("天线座底部")},
        {"measurement_ant_height",0.000},
        {"ant_height_corrent",0.000},
        {"ant_phase_height",0.000},
        {"ant_pedestal_height",0.000},
        {"ant_manufacturer","Unknown"},
        {"ant_type","Unknown"},
        {"ant_sn","Unknown"},
        {"receiver_sn","Unknown"},
        {"receiver_type","Unknown"},
        {"receiver_version","Unknown"},
        {"rinex_measurement_method","Unknown"},
        {"rinex_ant_height","Unknown"},
        {"rinex_ant_type","Unknown"},
        {"rinex_manufacturer","Unknown"},

        {"file_path","F:/Test/"+station_name+"202410300000.24O"}
        };
}

QVariantMap ResourceDataController::generateBaselineData(const QString &station_start,const QString &station_end)
{
    return {
        {"baseline_id","B00("+ station_start + "->"+station_end+")"},
        {"baseline_type",tr("静态")},
        {"start_station",station_start},
        {"end_station",station_end},
        {"start_file",station_start+"202410300000.24O"},
        {"end_file",station_end+"202410300000.24O"},
        {"solution_type",tr("固定解")},
        {"utilization_percentage",QRandomGenerator::global()->bounded(0, 10000)/100.0},
        {"sync_seconds",86399},
        {"solution_ratio",QRandomGenerator::global()->bounded(0, 1000000)/10000.0},
        {"solution_rms",QRandomGenerator::global()->bounded(0, 1000)/10000.0},
        {"solution_check",tr("合格")},
        {"solution_dx",QRandomGenerator::global()->bounded(400000000, 800000000)/10000.0},
        {"solution_dy",QRandomGenerator::global()->bounded(400000000, 800000000)/10000.0},
        {"solution_dz",QRandomGenerator::global()->bounded(400000000, 800000000)/10000.0},
        {"solution_stdx",QRandomGenerator::global()->bounded(0, 500)/10000.0},
        {"solution_stdy",QRandomGenerator::global()->bounded(0, 500)/10000.0},
        {"solution_stdz",QRandomGenerator::global()->bounded(0, 500)/10000.0},
        {"solution_horizontal_distance",QRandomGenerator::global()->bounded(400000000, 800000000)/10000.0}, //平距
        {"solution_slope_distance",QRandomGenerator::global()->bounded(600000000, 1100000000)/10000.0},//斜距
        {"solution_elevation_difference",QRandomGenerator::global()->bounded(0, 3000000)/10000.0},//高差
        {"solution_forward_angle",QRandomGenerator::global()->bounded(0, 3600000)/10000.0},//NS前进方向角
        {"solution_ellipsoidal_distance",QRandomGenerator::global()->bounded(600000000, 1200000000)/10000.0},//椭球距离
        {"solution_geodetic_height",QRandomGenerator::global()->bounded(1000000, 8000000)/10000.0},//大地高
        {"solution_RDOP",QRandomGenerator::global()->bounded(0, 8000)/10000.0},//
        {"solution_PDOP",QRandomGenerator::global()->bounded(0, 8000)/10000.0},//
        {"solution_HDOP",QRandomGenerator::global()->bounded(0, 8000)/10000.0},//
        {"solution_VDOP",QRandomGenerator::global()->bounded(0, 8000)/100000.},
        {"baseline_enuse",tr("是")}
        };
}

QVariantMap ResourceDataController::generateResourceData()
{
    return {  {"expanded", false}};
}

// QVariantMap ResourceDataController::generateRowData() {
//     return {
//         {"name", m_names.at(QRandomGenerator::global()->bounded(m_names.size()))},
//         {"age", QRandomGenerator::global()->bounded(20, 60)},
//         {"address", m_addresses.at(QRandomGenerator::global()->bounded(m_addresses.size()))},
//         {"avatar", m_avatars.at(QRandomGenerator::global()->bounded(m_avatars.size()))},
//         {"description",
//          m_descriptions.at(QRandomGenerator::global()->bounded(m_descriptions.size()))},
//         // {"height", 48},
//         // {"minimumHeight", 40},
//         // {"maximumHeight", 240},
//         {"expanded", false},
//     };
// }
