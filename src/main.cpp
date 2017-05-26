#include <stdio.h>
#include <iostream>
#include <time.h>
#include <oo.h>
#include <windows.h>

#include "object.h"
#include "DbsSite.h"

const int THREAD_COUNT = 2;
const char *DBNAME="Folder";
const char *OBJNAME="Element";
const char* fdfilename = "/dev/emerson/mt_test/data/testfd.boot";

char time1[10];

#ifdef _MSC_VER
#endif 

void snap_header()
{
  std::cout << "TID = " << GetCurrentThreadId() << " " ;
}

void* main_thread_function (void* );
ooBoolean tran_func(const char *comment);


int main(int argc, char *argv[])
{

  ooHandle(ooFDObj) fdH;
  ooInit();
  ooTrans  trans;
  trans.start();
  if(fdH.open(fdfilename, oocUpdate) == oocSuccess)

    if (fdH.isValid())
    {
      std::cout << "Open FD[" << fdfilename << "] successed @"  << _strtime(time1) << std::endl;
    }
    else
    {
      std::cout << "Open FD[" << fdfilename << "] failed @" << _strtime(time1) << std::endl;
      return oocFalse;
    }
    ooHandle(ooDBObj) dbH;
    if (dbH.exist(fdH, "Folder")) {
      dbH.open(fdH, "Folder", oocUpdate);
    } else {
      dbH = new ooDBObj("Folder");
    }
    trans.commit();

    HANDLE* threadH_p = new HANDLE [ THREAD_COUNT ] ;
    int forever =1;

    LPDWORD tid = NULL;
    for ( int tn = 0; tn < THREAD_COUNT; tn++ ) 
    {
      threadH_p[tn] = CreateThread (
        NULL, 
        0, 
        (LPTHREAD_START_ROUTINE) main_thread_function,
        0,
        0,
        tid ); 	
    }

    WaitForMultipleObjects((DWORD)THREAD_COUNT,threadH_p,true,INFINITE);
    return 0;

}

void* main_thread_function (void* )
{
  ooInitThread();

  tran_func("in");
  snap_header(); std::cout <<" finished thread" <<std::endl;
  ooTermThread();

  return (void*) 0 ;
}

ooBoolean tran_func(const char *comment)
{

  ooHandle(ooFDObj) fdH;
  ooTrans  trans;
  trans.start();
  if(fdH.open(fdfilename, oocUpdate) == oocSuccess)
  {
    snap_header(); std::cout<< "opened fd @" << _strtime(time1) <<std::endl;
  }
  else
  {
    snap_header(); std::cout <<"failed to open fd @" << _strtime(time1) <<std::endl;
  }

  ooHandle(ooDBObj) dbH;
  ooHandle(ooContObj) contH;
  ooHandle(TestObject) objH;
  ooHandle(DbsSite) dbsSiteH;

  if (dbH.exist(fdH, DBNAME)) {
    dbH.open(fdH, DBNAME, oocUpdate);
  } else {
    dbH = new ooDBObj(DBNAME);
  }

  snap_header();
  if (dbH.isValid()) {
    std::cout << comment << "Open DB[" << DBNAME << "] successed" << std::endl;
  } else {
    std::cout << comment << "Open DB[" << DBNAME << "] failed" << std::endl;
    return oocFalse;
  }
  snap_header();
  std::cout <<" in session" <<std::endl;    
  // old_style not for new catalog 
  // contH = new(NULL,0,0,0,dbH) ooContObj();
  contH = new(dbH) ooContObj();
  if(contH == NULL)
  {
    std::cout <<"failed to create container" <<std::endl;
  }
  objH = new(contH) TestObject("Just a name ");
  //dbsSiteH = new(contH) DbsSite();

  //	char* a = new char[20];
  //	ltoa(GetCurrentThreadId(),a,10);
  //	contH.nameObj(a);
  //	trans.commit();
  //	trans.start();
  //ooHandle(Library)	libraryH = ooThis(); 

  contH = objH.containedIn();
  //ooDelete(objH);
  trans.commit();
  return oocTrue;
}
