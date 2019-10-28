using System;

namespace CRS
{
    public class Register
    {
        int id {get; set;}
        bool bActive {get; set;} //<!-- Time (semester ending) and Action (dropping) Dependent -->
        int iCourseId {get; set;}
        int studentId {get; set;}
        DateTime dateRegister {get; set;}
    }
}