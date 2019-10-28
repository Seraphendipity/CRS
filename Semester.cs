using System;

namespace CRS
{
    public class Semester
    {
        int id {get; set;}
        String initials {get; set;} // Check if in stored "section list"
        DateTime dateStart {get; set;}
        DateTime dateEnd {get; set;}

        // getName(): Return name from `initials`, e.g. FA -> Fall
    }
}