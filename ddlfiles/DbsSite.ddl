#include "DbfEditableObject.h"
#include "DbsSiteNeeds.ddl"

#define MAX_VERSIONABLE_ITEMTYPES 100
#define DBE_ATTRIBUTE_TYPE_LAST_MARKER 100
#define DBS_MAX_ATTRIBUTE_GROUPS 100

#define DbeCommunicationType uint32

class DbsSite : public DbfEditableObject
{
		// Associations
		inline ooRef (DbsArea)                                          plantAreas[] <-> site : delete(propagate) ;
		ooRef (DbsNode)                                                      nodes[] <-> site : delete(propagate) ;
		ooRef (DbsLicenseTarget)                                          sessions[] <-> site : delete(propagate) ;
		ooRef (DbsNodeType)                                              nodeTypes[] <-> site : delete(propagate) ;
		ooRef (DbsCapability)                                         capabilities[] <-> site : delete(propagate) ;
		inline ooRef (DbsFunctionBlock)                             functionBlocks[] <-> site : delete(propagate) ;
		ooRef (DbsAlarmAnnunciation)                     alarmAnnunciations[] <-> site : delete(propagate) ;
		ooRef (DbsQueryFilter)                                 queryFilters[] <-> site : delete(propagate) ;
		ooRef (DbsIoCardDefinition)                       ioCardDefinitions[] <-> site : delete(propagate) ;
		ooRef (DbsIoChannelDefinition)                 ioChannelDefinitions[] <-> site : delete(propagate) ;
		inline ooRef (DbsDeviceSignalTag)                         deviceSignalTags[] <-> site : delete(propagate) ;
		inline ooRef (DbsDeviceSignalTag)                unallocatedDevices[] <-> unallocatedDevicesContainer ;
		ooRef (DbsProcessControlNetwork)             processControlNetworks[] <-> site : delete(propagate) ;
		ooRef (DbsUiString)                                       uiStrings[] <-> site : delete(propagate) ;
		ooRef (DbsSoftwareLicenseBundle)             softwareLicenseBundles[] <-> site : delete(propagate) ;
		inline ooRef (DbfInstallableGlobalItem)             installableGlobalItems[] <-> site : delete(propagate) ;
		ooRef (DbsInstallationList)                       installationLists[] <-> site : delete(propagate) ;
		ooRef (DbsSystemLimits)                                  systemLimits <-> site : delete(propagate) ;
		ooRef (DbfLaunchedApplication)                 launchedApplications[] <-> site ;
		ooRef (DbfInstallationRecord)            unknownInstallationRecords[] <-> site ;
		ooRef (DbsOperatorShift)                             operatorShifts[] <-> site : delete(propagate);
		ooRef (DbsDisplayBase)                                     displays[] <-> site : delete(propagate);
		ooRef (DbsProvoxIoFileDefinition)           provoxIoFileDefinitions[] <-> site : delete(propagate) ;
		ooRef (DbsProvoxIoSubsystemDefinition)      provoxIoSubsystemDefinition <-> site : delete(propagate) ;
		ooRef (DbsRs3IoCardCageDefinition)         rs3IoCardCageDefinitions[] <-> site : delete(propagate)  ;
		ooRef (DbsHistorySubsystem)               trendBlockHistorian <-> site : delete(propagate) ;
		ooRef (DbsScannerIoSubsystemDefinition)      scannerIoSubsystemDefinitions[] <-> siteScanIo : delete(propagate) ;
		ooRef (DbsGatewayIoSubsystemDefinition)      gatewayIoSubsystemDefinitions[] <-> site : delete(propagate) ;
		ooRef (DbsCharmIoSubsystemDefinition)          charmIoSubsystemDefinitions[] <-> site : delete(propagate) ;
		ooRef (DbsCharmTemplate)									charmTemplates[] <-> site : delete(propagate) ;
		ooRef (DbsAssetDefinition)                       assetDefinition <-> site : delete(propagate)  ;
		ooRef (DbsEnumerationEntryReferenceHolder) enumerationEntryReferences[] <-> site : delete(propagate) ;
		ooRef (DbsSlsNetwork)                     slsNetwork <-> site : delete(propagate) ;
		ooRef (DbsHartDevice)										hartDevices[] <-> site : delete(propagate) ;
		ooRef (DbsInstrumentSignalDefinition)		instrumentSignalDefinitions[] <-> site : delete(propagate) ;
		ooRef (DbsZoneBase)                                       siteZones[] <-> site : delete(propagate) ;
		ooRef (DbsAlarmReport)                                 alarmReports[] <-> site : delete(propagate) ;
		ooRef(DbsCertificate)                                 certificates[] <-> site : delete(propagate);

		ooRef (DbsAppData)											appData[] <-> site : delete(propagate) ;
		ooRef(ooMap) appDataMap ;
		
		// security associations
		ooRef (DbsUser)                                               users[] <-> site : delete(propagate) ;
		ooRef (DbsGroup)                                             groups[] <-> site : delete(propagate) ;

		// Miscellaneous

		ooRef (DbsPlantArea)  m_moduleLibraryPlantArea ;              // Uni-directional
		ooRef (DbsFieldDeviceRoot) m_fieldDeviceRoot ;                // Uni-directional
		ooRef (DbsBatchRoot) m_batchRoot ;                            // Uni-directional
		ooRef (DbsBatchEquipmentPhaseClass) m_undefinedPhaseClass;    // Uni-directional
		
		//ES9.3 This is now a pointer to the unresolvedReferenceRoot in the LocalZone.
		ooRef (DbsUnresolvedReference ) m_unresolvedReferenceRoot;    // Uni-direcional
		ooRef (DbsBatchUnitModuleDefinition ) m_primitiveUnitClass;   // Uni-direcional
		ooRef (DbsBatchEquipmentPhaseClass ) m_primitivePhaseClass;   // Uni-direcional
		ooRef (DbfObjectIdIndex ) m_objectIdIndex;                    // Uni-direcional
		ooRef (DbsEngineeringUnits ) m_engineeringUnits;              // Uni-direcional
		ooRef (DbsRootCategory) m_documentsRoot ;                     // Uni-directional
		ooRef (DbsElectronicSignaturesRoot) m_electronicSignaturesRoot ;  // Uni-directional
		ooRef (DbsProcessSimulationRoot) m_processSimulationRoot ;    // Uni-directional
		ooRef (DbsRootCategory) m_displaysRoot ;                      // Uni-directional
		ooRef (DbsSetupItemsRoot) m_setupItemsRoot ;                  // Uni-directional
		ooRef (DbsSetupItemsRoot) m_sisSetupItemsRoot ;               // Uni-directional
		ooRef (DbsLocalZone) m_localZone ;                            // Uni-directional
		ooRef (DbsGraphicsRoot) m_graphicsRoot ;                      // Uni-directional


		ooRef (DbfNamedObject)                itemsRequiringNameTruncation [] <-> site : delete(propagate);

		ooRef (DbsDeviceTagExtractionPolicy) m_deviceTagExtractionPolicy ;  // Uni-directional

		// Maps

  // Temporarily make the maps public
  public:
		ooRef (ooMap) plantAreaMap ;
		ooRef (ooMap) nodeMap ;
		ooRef (ooMap) alarmTypeMap ;
		ooRef (ooMap) alarmAnnunciationMap ;
		ooRef (ooMap) queryFilterMap ;
		ooRef (ooMap) ioCardDefinitionMap ;
		ooRef (ooMap) ioChannelDefinitionMap ;
		ooRef (ooMap) deviceSignalTagMap ;
		ooRef (ooMap) unallocatedDeviceMap ;
		ooRef (ooMap) functionBlockMap ;
		ooRef (ooMap) taggedObjectMap ;
		ooRef (ooMap) nameSpaceObjectMap ;
		ooRef (ooMap) rootCategoryMap ;
		ooRef (ooMap) processControlNetworkMap ;
		// Leave the All EnumerationSetMap on Site to enforce name uniqueness
		// accross all named sets. DbsEnumerationSetRoot can be used to determine type of Named sets.
		ooRef (ooMap) allEnumerationSetMap ;
		ooRef (ooMap) uiStringMap ;
		ooRef (ooMap) softwareLicenseMap ;
		ooRef (ooMap) softwareLicenseBundleMap ;
		ooRef (ooMap) installableGlobalItemMap ;
		ooRef (ooMap) installationListMap ;
		ooRef (ooMap) operatorShiftMap;
		ooRef (ooMap) displayMap;
		ooRef (ooMap) ioFileDefinitionMap;
		ooRef (ooMap) rs3IoCardCageDefinitionMap;
		ooRef (ooMap) terminalSessionMap ;
		ooRef (ooMap) scannerIoSubsystemDefinitionMap;
		ooRef (ooMap) gatewayIoSubsystemDefinitionMap;
		ooRef (ooMap) charmIoSubsystemDefinitionMap;
		ooRef (ooMap) alarmReportMap;
		ooRef (ooMap) charmTemplateMap;
		ooRef(ooMap) applicationCertificateMap;
		ooRef(ooMap) certificateMap;

		//security maps
		ooRef (ooMap) userMap ;
		ooRef (ooMap) groupMap ;

		// Version Control Maps
		ooRef(ooMap) dbidMap ;
		ooRef(ooMap) nonExistentItemMap[MAX_VERSIONABLE_ITEMTYPES] ;

		// Download tracking maps
		ooRef(ooMap) deletedModulesInstallationRecordMap ;

  private:
		// Special containers
		ooRef ( ooContObj ) m_dstContainer ;

		// Attribute types - default value

		ooRef(DbsAttributeValue)    m_attributeValues[int(DBE_ATTRIBUTE_TYPE_LAST_MARKER)] ;
		ooRef(DbsAttributeValue)    m_allAttributeValues[int(DBE_ATTRIBUTE_TYPE_LAST_MARKER)] ;
		
		// Module type caching
		ooVArray(unsigned long) m_taggedObjectTypeArray  ;


		DbhStringSet m_registeredNames ;

		DbeCommunicationType        m_defaultCommunicationType ;
		unsigned short              m_systemId ;
		unsigned short              m_lastNodeIndex ;
		boolean                     m_ipAddressAutogenerated ;
		unsigned long               m_lastInstallationListId ;
		unsigned long               m_nextUpdateInterestId ;
		time_t                      m_proPlusLicenseActivationDate ;
		boolean                     m_populated ;
		boolean                     m_onlineUpgraded ;
		boolean                     m_zonesEnabled ;
		boolean 					m_showDocumentsFolder;
			
		// time of last modification to the database
		time_t						m_lastDatabaseModifiedTime;

		// Loop Doctor properties
		float m_pvqLimit ;
		float m_bckLimit ;
		float m_mnnLimit ;

		DbfString m_companyName ;

		long m_defaultLogicSolverVersion;

		// VersionControl
		boolean                     m_versionControlEnabled;
		boolean                     m_displayVersionControlEnabled;
		boolean                     m_importedDisplayVersionControlEnabled;
		boolean                     m_sisVersionControlEnabled;
		// Authorization Features;
		boolean                     m_recipeAuthorizationEnabled ;
		boolean                     m_sifModuleAuthorizationEnabled ;
		boolean                     m_sifFunctionTestEnabled ;

		// XML export
		int                         m_nextSessionId ;

		// Domain Name Support (Hardened Workstation Project)
		DbhStringSet				m_domainNameList ;


		DbhAttributeGroup m_attributeGroups[DBS_MAX_ATTRIBUTE_GROUPS] ;

};

