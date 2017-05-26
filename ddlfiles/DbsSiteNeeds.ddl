class DbsSite;

class DbsArea: ooObj {
	inline ooRef (DbsSite)  site  <->  plantAreas[] ;
};

class DbsNode: ooObj {
		 ooRef (DbsSite)  site  <->  nodes[] ;
};

class DbsLicenseTarget: ooObj {
		 ooRef (DbsSite)  site  <->  sessions[] ;
};

class DbsNodeType: ooObj {
		 ooRef (DbsSite)  site  <->  nodeTypes[] ;
};

class DbsCapability: ooObj {
		 ooRef (DbsSite)  site  <->  capabilities[] ;
};

class DbsFunctionBlock: ooObj {
	inline ooRef (DbsSite)  site  <->  functionBlocks[] ;
};

class DbsAlarmAnnunciation: ooObj {
		ooRef (DbsSite)         site  <->  alarmAnnunciations[] ;
};


class DbsQueryFilter: ooObj {
		ooRef (DbsSite)        site                         <->  queryFilters[]  ;
};


class DbsIoCardDefinition: ooObj {
		ooRef (DbsSite)         site              <->  ioCardDefinitions[] ;
};


class DbsIoChannelDefinition: ooObj {
		ooRef (DbsSite)         site        <->  ioChannelDefinitions[]  ;
};


class DbsDeviceSignalTag: ooObj {
	inline ooRef (DbsSite)   site                     <->   deviceSignalTags[]  ;
	inline ooRef (DbsSite)   unallocatedDevicesContainer            <->   unallocatedDevices[] ;
};


class DbsProcessControlNetwork: ooObj {
		ooRef (DbsSite)          site    <->  processControlNetworks[] ;
};


class DbsUiString: ooObj {
		ooRef (DbsSite)         site                              <->  uiStrings[]  ;
};


class DbsSoftwareLicenseBundle: ooObj {
		ooRef (DbsSite)         site    <->  softwareLicenseBundles[] ;
};


class DbfInstallableGlobalItem: ooObj {
	inline ooRef (DbsSite)   site           <->  installableGlobalItems[];
};

class DbsInstallationList: ooObj {
		ooRef (DbsSite)          site              <->  installationLists[];
};

class DbsSystemLimits: ooObj {
		ooRef (DbsSite)          site                       <->  systemLimits ;
};


class DbfInstallationRecord: ooObj {
		ooRef (DbsSite)          site   <->  unknownInstallationRecords[];
};

class DbsOperatorShift: ooObj {
		ooRef (DbsSite)          site                   <->  operatorShifts[] ;
};

class DbsDisplayBase: ooObj {
		ooRef (DbsSite)          site                           <->  displays[] ;
};

class DbsProvoxIoFileDefinition: ooObj {
		ooRef (DbsSite)          site  <->  provoxIoFileDefinitions[] ;
};

class DbsProvoxIoSubsystemDefinition: ooObj {
		ooRef (DbsSite)      site <->  provoxIoSubsystemDefinition ;
};

class DbsRs3IoCardCageDefinition: ooObj {
		ooRef (DbsSite)      site    <->  rs3IoCardCageDefinitions[]  ;
};

class DbsHistorySubsystem: ooObj {
		ooRef (DbsSite)       site       <->   trendBlockHistorian  ;
};

class DbsScannerIoSubsystemDefinition: ooObj {
		ooRef (DbsSite)      siteScanIo <->  scannerIoSubsystemDefinitions[] ;
};

class DbsGatewayIoSubsystemDefinition: ooObj {
		ooRef (DbsSite)     site  <->  gatewayIoSubsystemDefinitions[];
};

class DbsCharmIoSubsystemDefinition: ooObj {
		ooRef (DbsSite)      site     <->  charmIoSubsystemDefinitions[] ;
};

class DbsCharmTemplate: ooObj {
		ooRef (DbsSite)			site						<->  charmTemplates[] ;
};

class DbsAssetDefinition: ooObj {
		ooRef (DbsSite)          site             <->   assetDefinition ;
};

class DbsEnumerationEntryReferenceHolder: ooObj {
		ooRef (DbsSite)         site  <->  enumerationEntryReferences[];
};

class DbsSlsNetwork: ooObj {
		ooRef (DbsSite)         site             <->  slsNetwork;
};

class DbsHartDevice: ooObj {
		ooRef (DbsSite)			site							<->  hartDevices[]  ;
};
class DbsInstrumentSignalDefinition: ooObj {
		ooRef (DbsSite)		site <->  instrumentSignalDefinitions[] ;
};
class DbsZoneBase: ooObj {
		ooRef (DbsSite)         site                              <->   siteZones[] ;
};
class DbsAlarmReport: ooObj {
		ooRef (DbsSite)          site                       <->  alarmReports[] ;
};
class DbsCertificate: ooObj {
		ooRef(DbsSite)            site                      <->  certificates[];
};
class DbsAppData: ooObj {
		ooRef (DbsSite)				site							<->  appData[]  ;
};
class DbsUser: ooObj {
		ooRef (DbsSite)             site                                  <->  users[]  ;
};
class DbsGroup: ooObj {
		ooRef (DbsSite)             site                                <-> groups[]   ;
};

class DbsPlantArea: ooObj {};
class DbsFieldDeviceRoot: ooObj {};
class DbsBatchRoot: ooObj {};
class DbsBatchEquipmentPhaseClass: ooObj {};
class DbsUnresolvedReference: ooObj {};
class DbsBatchUnitModuleDefinition: ooObj {};
class DbfObjectIdIndex: ooObj {};
class DbsEngineeringUnits: ooObj {};
class DbsRootCategory: ooObj {};
class DbsElectronicSignaturesRoot: ooObj {};
class DbsProcessSimulationRoot: ooObj {};
class DbsSetupItemsRoot: ooObj {};
class DbsLocalZone: ooObj {};
class DbsGraphicsRoot: ooObj {};
class DbsDeviceTagExtractionPolicy: ooObj {};
class DbsAttributeValue : ooObj {};


class DbhAttributeGroup {};

