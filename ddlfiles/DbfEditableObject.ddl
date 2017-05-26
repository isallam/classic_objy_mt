#define boolean uint8
#include "DbfNamedObject.h"

class DbfEditableObject;

class DbeDisplayRole {};

class DbfLaunchedApplication : ooObj {
		ooRef (DbfEditableObject)     readInterests[] <->   readInterests[];
		ooRef (DbfEditableObject)     writeInterests[] <->   writeInterests[];
		ooRef (DbsSite)          site        <->  launchedApplications[];
};

class DbsCategory : ooObj {
		ooRef (DbfEditableObject)   categoryMembers[] <-> category;
};

class DbfUpdateInterest : ooObj {
		ooRef (DbfEditableObject)   monitoredObject <-> updateInterests[] ;
};

class DbfVersionControlRecord : ooObj {
		ooRef (DbfEditableObject)   itemFor <-> itemVersionControl ;
};

class DbfEditableObject : public DbfNamedObject
{

		// member variables
		boolean m_installRequired ;
		boolean m_totalInstallRequired ;
		DbfString m_userName ;
		DbfString m_description ;
		DbeDisplayRole m_fixedRole ;
		DbfString m_stringRole ;
		time_t m_timeStamp ;
		// Item Authorization
		boolean   m_authorizationStatus ;
		// Encryption
		DbfString m_encryptionPassword ;
		boolean   m_isEncrypted ;
		boolean   m_isSisItem ;

		// Caching
		boolean   m_typeInfoCached ;

		// Associations
		ooRef (DbfLaunchedApplication)      readInterests[] <-> readInterests[] ;
		ooRef (DbfLaunchedApplication)      writeInterests[] <-> writeInterests[] ;
		ooRef (DbsCategory)                 category <-> categoryMembers[] ;
		ooRef (DbfNamedObject)              installableItems[] <-> installationComponents[] ;
		ooRef (DbfEditableObject)           workInProgress <-> workInProgressFor : delete(propagate) ;
		ooRef (DbfEditableObject)           workInProgressFor <-> workInProgress ;
		inline ooRef (DbfEditableObject)           stubbedAs <-> stubFor : delete(propagate) ;
		inline ooRef (DbfEditableObject)           stubFor <-> stubbedAs ;
		ooRef (DbfUpdateInterest)           updateInterests[] <-> monitoredObject ;
		ooRef (DbfVersionControlRecord)     itemVersionControl <-> itemFor ;
		ooRef (DbfEditableObject )          original   <-> replicate[] ;
		ooRef (DbfEditableObject )          replicate[]  <-> original ;

		ooRef (DbfEditableObject)           exportDependsOnNameOf[] <->  hasExportDependencyOnOurName[] ;
		ooRef (DbfEditableObject)           hasExportDependencyOnOurName[] <->  exportDependsOnNameOf[] ;

};


