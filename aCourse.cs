using System;

namespace CRS
{
    public class aCourse
    {
        int id {get; set;}
        bool bActive {get; set;} // <!-- Only if course is removed from listing; time-independent, action-dependent -->
        int departmentId {get; set;}
        String code {get; set;}
        String title {get; set;}
        String description {get; set;}

        // getAbbreviation(): string `department+code`, e.g. EE433 
    }
}