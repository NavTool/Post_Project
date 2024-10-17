// CDM_Service：定义程序入口点

#include "MyStdAfx.h"
#include "CommFunc.h"
#include "CDMApp.h"
#include "IniFile.h"
#include "register.h"
#include <string>
CEasyLog g_ClientLog;  //全局日志对象
CIniFile* g_pConfig = NULL; //全局配置文件对象

bool checkRegisterCode()
{
	CRegister* g_pRegister = new CRegister();
	std::string machinecode = g_pRegister->genMachineCode();
	if (machinecode.empty())
	{
		MYTRACE(LOG_LEVEL_ERROR, "网卡状态异常！");
		return false;
	}
	g_pConfig->WriteString(REGISTER_CODE, KEY_MACHINE_CODE, machinecode);
	std::string registerCode = g_pConfig->ReadString(REGISTER_CODE, KEY_REGISTER_CODE, "");
	bool result = g_pRegister->checkRegest(registerCode);
	delete g_pRegister;

	return result;
}

int NormalMain(int argc, char* argv[])
{
	//CCDMApp::GetInstance()->InitGlobal(argc,argv);
	CCDMApp::GetInstance()->Init();
	CCDMApp::GetInstance()->Loop();
	CCDMApp::ReleaseInstance();
	return 0;
}

int main(int argc, char* argv[])
{
	//	获取程序路径
	std::string strFilePath;
	CCommFunc::GetProgrammeDir(strFilePath);
	// 设置控制文件Config.ini文件路径
	std::string strConfigFile = strFilePath + FILESEP + "Config.ini";
	g_pConfig = new CIniFile(strConfigFile);
	if (g_pConfig == NULL)
	{
		return -1;
	}
	// 从配置文件中获取日志级别
	int iLogLevel = g_pConfig->ReadInt(GLOABL_SECTION, KEY_LOGLEVEL, LOG_LEVEL_DEBUG);

	std::string logpath = g_pConfig->ReadString(GLOABL_SECTION, KEY_LOGPATH, ".\\log");
	char YMD[15] = { 0 };
	time_t currentTime;
	struct tm* nowTime;

	time(&currentTime);
	nowTime = localtime(&currentTime);

	strftime(YMD, sizeof(YMD), "%Y-%m-%d", nowTime);
	std::string strLogFile = logpath + FILESEP + "CDMSERVICE_" + YMD + ".log";
	CCommFunc::CreateDirectoryM(logpath);
	
	if (!checkRegisterCode())
	{
		printf("软件未注册！\n");
		MYTRACE(LOG_LEVEL_ERROR, "软件未注册！");
		return -1;
	}

	// 打开日志
	g_ClientLog.Open(logpath.c_str(), strLogFile.c_str(), iLogLevel);

	// 测试日志
	MYTRACE(LOG_LEVEL_INFO, "CDMService Start!");
	int iResult = 0;

	iResult = NormalMain(argc, argv);
	return iResult;

}