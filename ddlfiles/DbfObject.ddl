#define WCHAR wchar_t
#define boolean uint8 

class DbfMapNode : public ooObj {
		ooRef(DbfObject) mappedObject <->  mapNodes[] ;
};

class DbfSmallMap : public ooObj {
		ooRef(DbfObject) mappedObjects[]  <->  inMaps[];
};
class DbhBasicObjectId {};
class DbePopulatedDataState {};

class DbfString
{
	ooVArray(WCHAR)	m_string ;
	ooVString m_asciiString ;
};

struct DbhStringProperties
{
    int16 length ;
    long hash ;
};

class DbhStringSet {

    long m_nStrings ;
	ooVArray(DbhStringProperties) m_stringProperties ;

    long m_lengthUsed ;
	ooVArray(WCHAR)		m_string ;

    boolean m_isSiteSet ;
} ;


class DbfAbstractObject : public ooObj
{
	boolean m_validObject ;
};

class DbfObject : public DbfAbstractObject
{
		ooRef(DbfMapNode) mapNodes[] <-> mappedObject : delete(propagate) ;
		ooRef(DbfSmallMap) inMaps[]  <-> mappedObjects[] ;
		DbhBasicObjectId m_objectId ;
		boolean          m_isXmlStub ;
		DbePopulatedDataState m_populatedDataState;   

};


