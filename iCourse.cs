using System;

namespace CRS
{
    public class iCourse : SCRElement
    {
        int aCourseId {get; set;}
        int semesterId {get; set;}
        int sectionId {get; set;}
        int instructorId {get; set;} 

        // getLevel(): the first 1-2 digits of crn, indicating level of the course.
        // getSemYear(): calls semester to get `semester+year` as string, e.g. FA2019.
    }
}