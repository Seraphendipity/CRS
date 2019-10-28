using System;

namespace CRS
{
    public class Register : SCRElement
    {

        //bool bActive {get; set;} //<!-- Time (semester ending) and Action (dropping) Dependent -->
        int iCourseId {get; set;}
        int studentId {get; set;}
        DateTime dateRegister {get; set;}
    }
}