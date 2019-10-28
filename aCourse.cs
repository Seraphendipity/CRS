using System;

namespace CRS
{
    public class aCourse : SCRElement
    {
        int departmentId {get; set;}
        String code {get; set;}
        String title {get; set;}
        String description {get; set;}

        // getAbbreviation(): string `department+code`, e.g. EE433 
    }
}