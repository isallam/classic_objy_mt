
#include "DbfObject.h"

class DbfEditableObject;
#pragma ooclassref DbfEditableObject <DbfEditableObject_ref.h>
class DbsSite;
#pragma ooclassref DbsSite <DbsSite_ref.h>


class DbfNamedObject : public DbfObject
{
		// Member variables

		long m_nameIndex;

		// Associations
		ooRef (DbfEditableObject)          installationComponents[] <-> installableItems[] ;
		ooRef (DbsSite)                                        site <-> itemsRequiringNameTruncation [] ;

};


